FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /src
COPY ["src/openPELServices/openPELServices.csproj", "src/openPELServices/"]
RUN dotnet restore "src/openPELServices/openPELServices.csproj"
COPY . .
WORKDIR "/src/src/openPELServices"
RUN dotnet build "openPELServices.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "openPELServices.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "openPELServices.dll"]
