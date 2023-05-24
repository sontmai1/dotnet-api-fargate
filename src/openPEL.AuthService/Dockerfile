FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /src
COPY ["src/openPEL.AuthService/openPEL.AuthService.csproj", "src/openPEL.AuthService/"]
RUN dotnet restore "src/openPEL.AuthService/openPEL.AuthService.csproj"
COPY . .
WORKDIR "/src/src/openPEL.AuthService"
RUN dotnet build "openPEL.AuthService.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "openPEL.AuthService.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "openPEL.AuthService.dll"]
