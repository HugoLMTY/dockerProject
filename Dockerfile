
# -------------------------- BASE --------------------------
FROM mcr.microsoft.com/dotnet/core/aspnet:2.1-stretch-slim as base

WORKDIR /app

EXPOSE 80
EXPOSE 443


# -------------------------- BUILD --------------------------
FROM mcr.microsoft.com/dotnet/core/sdk:2.1-stretch as build

WORKDIR /src
RUN mkdir -p /src/Services
RUN mkdir -p /src/Events

COPY appscore/Foundation/Events Events/
COPY appscore/Services/ Services/

RUN dotnet restore Services/Applicants.Api/applicants.api.csproj
#NOTES: identity.Api.csproj with capital A and I
RUN dotnet restore Services/Identity.Api/Identity.Api.csproj
RUN dotnet restore Services/Jobs.Api/jobs.api.csproj

RUN dotnet restore Events/Events.csproj

# COPY . .
