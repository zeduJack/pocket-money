
FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app

ENV ASPNETCORE_URLS=http://+:5000
ENV ASPNETCORE_ENVIRONMENT Development

# Creates a non-root user with an explicit UID and adds permission to access the /app folder
# For more info, please refer to https://aka.ms/vscode-docker-dotnet-configure-containers
RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ./src .
RUN dotnet restore "./backend/backend.csproj"
#RUN dotnet dev-certs https -ep ${HOME}/.aspnet/https/aspnetapp.pfx -p  superpassword
#RUN dotnet dev-certs https --trust

WORKDIR "/src"
RUN dotnet build "./backend/backend.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "./backend/backend.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "backend.dll"]