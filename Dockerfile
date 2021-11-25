FROM mcr.microsoft.com/dotnet/sdk:5.0

RUN apt-get update
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs

WORKDIR /MyApp
COPY ./DotnetTemplate.Web/ /MyApp/DotnetTemplate.Web/
COPY ./DotnetTemplate.Web.Tests/ /MyApp/DotnetTemplate.Web.Tests/
COPY ./DotnetTemplate.sln /MyApp/
COPY ./DotnetTemplate.sln.DotSettings /MyApp/
RUN dotnet build

WORKDIR /MyApp/DotnetTemplate.Web/
RUN npm install
RUN npm run build

ENTRYPOINT ["dotnet", "run"]

