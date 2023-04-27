# --------------- Base ---------------
FROM mcr.microsoft.com/dotnet/core/aspnet:2.1-stretch-slim AS base

WORKDIR /app

EXPOSE 80
EXPOSE 443


# --------------- Build ---------------
FROM mcr.microsoft.com/dotnet/core/sdk:2.1-stretch AS build
WORKDIR /src
COPY "appscore/Web" "Web/"
COPY "appscore/Foundation/Http" "Foundation/Http/"

RUN dotnet restore "Web/Web.csproj"
COPY . .
WORKDIR "/src/Web/"
RUN dotnet build "Web.csproj" -c Release -o /app/build


# --------------- Publish ---------------
FROM build AS publish
RUN dotnet publish "Web.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
CMD ["dotnet", "Web.dll"]