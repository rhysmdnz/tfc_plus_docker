FROM openjdk:8-alpine
WORKDIR /opt/minecraft

VOLUME /opt/minecraft/world

RUN wget https://maven.minecraftforge.net/net/minecraftforge/forge/1.7.10-10.13.4.1614-1.7.10/forge-1.7.10-10.13.4.1614-1.7.10-installer.jar \
  && java -jar forge-1.7.10-10.13.4.1614-1.7.10-installer.jar --installServer \
  && rm forge-1.7.10-10.13.4.1614-1.7.10-installer.jar
RUN mkdir mods && cd mods \
  && wget https://media.forgecdn.net/files/3204/442/%5b1.7.10%5dTerraFirmaCraftPlus-0.87.0.jar \
  && wget https://media.forgecdn.net/files/3293/859/CodeChickenCore-1.7.10-1.0.7.48-universal.jar \
  && wget https://media.forgecdn.net/files/2302/312/NotEnoughItems-1.7.10-1.0.5.120-universal.jar \
  && wget https://media.forgecdn.net/files/2876/172/TFC-TweaksPlus-1.7.10-0.4.0.jar \
  && wget https://github.com/tfc-plus-addons/MerchantsTFC/releases/download/v1.1.7/1.7.10.Merchants-1.1.7.jar \
  && wget https://github.com/tfc-plus-addons/TFC-Cellars-Addon/releases/download/v1.2/1.7.10.TFCPlusCellarsAddon-1.2.jar \
  && wget https://github.com/nuckable/DecorationsTFC/releases/download/1.0.20/1.7.10.Decorations-1.7.10-1.0.20.jar \
  && wget https://github.com/nuckable/Cooking-with-TFC/releases/download/0.0.7.3/CookingWithTFC-1.7.10-0.0.7.3.jar \
  && wget https://media.forgecdn.net/files/2367/915/journeymap-1.7.10-5.1.4p2-unlimited.jar \
  && wget https://media.forgecdn.net/files/3377/679/TerraFirmaCraftPlusNEIplugin-1.7.10-1.8.0.jar \
  && wget https://media.forgecdn.net/files/3184/546/TFC%2B-PrimtiveTechnologyPlus-1.7.10-0.3.jar \
  && wget https://github.com/blat-blatnik/TFC-Quick-Pockets/releases/download/v1.1.6/tfcquickpockets-1.1.6.jar \
  && wget https://media.forgecdn.net/files/3197/290/tfcthinice-1.0.jar \
  && wget https://media.forgecdn.net/files/2230/518/Waila-1.5.10_1.7.10.jar \
  && wget https://github.com/tfc-plus-addons/TFC-Wells/releases/download/v1.2/1.7.10.TFC.Wells-1.2.jar \
  && wget https://github.com/nuckable/TerraMisc/releases/download/0.14.7/TFCM-1.7.10-0.14.7.jar
RUN echo "eula=true" > eula.txt

ENTRYPOINT ["java", "-Xms1024M", "-Xmx8192M", "-jar", "forge-1.7.10-10.13.4.1614-1.7.10-universal.jar", "nogui"]
EXPOSE 25565
