<?xml version="1.0" encoding="utf-8" standalone="no"?>
<!DOCTYPE simulation SYSTEM "http://contiki.sourceforge.net/cooja/simulation.dtd">
<simulation simtimestamp="0" title="Border Intrusion WSN - Perfect Links" description="Sensors -> Cluster Head -> Gateway, PowerTracker enabled">
  <randomseed>12345</randomseed>
  <motecount>7</motecount>

  <!-- Radio medium: UDGM with perfect delivery -->
  <medium>
    <udgm-distirelpdu>
      <transmittingRange>500</transmittingRange>
      <interferenceRange>600</interferenceRange>
      <successRatio>1.0</successRatio>
      <maxConnections>100</maxConnections>
      <visibilityDistance>1000</visibilityDistance>
    </udgm-distirelpdu>
  </medium>

  <!-- Mote types (point to your Contiki source files in repo root) -->
  <motetypes>
    <!-- Sensor mote type -->
    <motetype>
      <identifier>sensor-type</identifier>
      <description>Border sensor (border_security.c)</description>
      <classname>org.contikios.cooja.mspmote.MspMoteType</classname>
      <sourcefiles>
        <sourcefile>
          <filename>border_security.c</filename>
          <filedata></filedata>
        </sourcefile>
      </sourcefiles>
      <firmware></firmware>
      <mote.interfaces/>
    </motetype>

    <!-- Cluster head mote type -->
    <motetype>
      <identifier>cluster-type</identifier>
      <description>Cluster Head (cluster_head.c)</description>
      <classname>org.contikios.cooja.mspmote.MspMoteType</classname>
      <sourcefiles>
        <sourcefile>
          <filename>cluster_head.c</filename>
          <filedata></filedata>
        </sourcefile>
      </sourcefiles>
      <firmware></firmware>
      <mote.interfaces/>
    </motetype>

    <!-- Gateway mote type -->
    <motetype>
      <identifier>gateway-type</identifier>
      <description>Gateway (gateway_ai.c)</description>
      <classname>org.contikios.cooja.mspmote.MspMoteType</classname>
      <sourcefiles>
        <sourcefile>
          <filename>gateway_ai.c</filename>
          <filedata></filedata>
        </sourcefile>
      </sourcefiles>
      <firmware></firmware>
      <mote.interfaces/>
    </motetype>
  </motetypes>

  <!-- Individual motes: 5 sensors, 1 cluster head, 1 gateway -->
  <motes>
    <!-- Sensor Node 1 -->
    <mote>
      <motetype_identifier>sensor-type</motetype_identifier>
      <interface_config>
        <position>
          <x>100.0</x><y>150.0</y><z>0.0</z>
        </position>
      </interface_config>
      <id>1</id>
      <startupdelay>0</startupdelay>
      <moteconfig/>
    </mote>

    <!-- Sensor Node 2 -->
    <mote>
      <motetype_identifier>sensor-type</motetype_identifier>
      <interface_config>
        <position>
          <x>300.0</x><y>140.0</y><z>0.0</z>
        </position>
      </interface_config>
      <id>2</id>
      <startupdelay>0</startupdelay>
      <moteconfig/>
    </mote>

    <!-- Sensor Node 3 -->
    <mote>
      <motetype_identifier>sensor-type</motetype_identifier>
      <interface_config>
        <position>
          <x>500.0</x><y>200.0</y><z>0.0</z>
        </position>
      </interface_config>
      <id>3</id>
      <startupdelay>0</startupdelay>
      <moteconfig/>
    </mote>

    <!-- Sensor Node 4 -->
    <mote>
      <motetype_identifier>sensor-type</motetype_identifier>
      <interface_config>
        <position>
          <x>700.0</x><y>120.0</y><z>0.0</z>
        </position>
      </interface_config>
      <id>4</id>
      <startupdelay>0</startupdelay>
      <moteconfig/>
    </mote>

    <!-- Sensor Node 5 -->
    <mote>
      <motetype_identifier>sensor-type</motetype_identifier>
      <interface_config>
        <position>
          <x>900.0</x><y>180.0</y><z>0.0</z>
        </position>
      </interface_config>
      <id>5</id>
      <startupdelay>0</startupdelay>
      <moteconfig/>
    </mote>

    <!-- Cluster Head Node 6 -->
    <mote>
      <motetype_identifier>cluster-type</motetype_identifier>
      <interface_config>
        <position>
          <x>500.0</x><y>80.0</y><z>0.0</z>
        </position>
      </interface_config>
      <id>6</id>
      <startupdelay>0</startupdelay>
      <moteconfig/>
    </mote>

    <!-- Gateway Node 7 -->
    <mote>
      <motetype_identifier>gateway-type</motetype_identifier>
      <interface_config>
        <position>
          <x>1100.0</x><y>100.0</y><z>0.0</z>
        </position>
      </interface_config>
      <id>7</id>
      <startupdelay>0</startupdelay>
      <moteconfig/>
    </mote>
  </motes>

  <!-- Plugins: Mote output, PowerTracker, RadioLogger -->
  <plugins>
    <plugin>
      <classname>org.contikios.cooja.plugins.MoteOutput</classname>
      <configuration/>
    </plugin>

    <plugin>
      <classname>org.contikios.cooja.plugins.PowerTracker</classname>
      <configuration>
        <option name="enabled">true</option>
        <option name="interval">1000</option>
        <option name="initialEnergy">10000.0</option>
      </configuration>
    </plugin>

    <plugin>
      <classname>org.contikios.cooja.plugins.RadioLogger</classname>
      <configuration/>
    </plugin>

    <plugin>
      <classname>org.contikios.cooja.plugins.DelayEditor</classname>
      <configuration/>
    </plugin>
  </plugins>

  <!-- Simulation settings -->
  <simulationtime>600000</simulationtime> <!-- 10 minutes default -->
</simulation>
