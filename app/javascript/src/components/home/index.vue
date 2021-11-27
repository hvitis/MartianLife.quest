<template>
  <layout>
      <v-shell
      :banner="banner"
      :shell_input="send_to_terminal"
      :commands="commands"
      @shell_output="prompt"
      ></v-shell>
      <!-- <a href='/admin'>{{ $t('home.admin_link') }}</a> -->
  </layout>
</template>

<script>
import Layout from '../shared/layout';

export default {
  components: {
    Layout,
  },
  data() {
    return {
      send_to_terminal: "",
      banner: {
        header: "Martian Life Quest 👩🏼‍🚀",
        subHeader: "You get the chance to finally verify if there are BUGS on the surface! (🐞🐜🦠)",
        helpHeader: 'Enter "start" for more information.',
        emoji: {
          first: "🌍",
          second: "🌎",
          time: 1000
        },
        sign: `houston $`,
        img: {
          align: "left",
          link: "https://i.ibb.co/xSX7cRZ/martian-sapiens-transparent.png",
          width: 100,
          height: 100
        }
      },
      commands: [
        {
          name: "start",
          get() {
            return `
            <p>Welcome Human! You have been accepted for a Mars mission! 
            Your main goal will be to find bugs on Mars!
            Do you accept the mission?

            Type: "accept" or "deny"
            </p>`;
          }
        },
        {
          name: "accept",
          get() {
            return `<p>
            Good! Take a debrief under the link!
            
            <a href="https://mars.nasa.gov/all-about-mars/facts/">Go! Go! Go!</a>
            
            </p>`;
          }
        },
        {
          name: "deny",
          get() {
            return `Sorry to see you go!`;
          }
        }
      ]
    };
  },
  methods: {
    prompt(value) {
      if (value.trim() === "ifconfig") {
        this.send_to_terminal = `
    Wi-Fi wireless network card:
        
    Local link IPv6 address. . . : fe80 :: 340f: 6f02: 41e9: 477b% 24
    IPv4 address. . . . . . . . .: 192.168.1.2
    Subnet mask. . . . . . . . . : 255.255.255.0
    Default Gateway. . . . . . . : 192.168.1.1`;
      } else {
        this.send_to_terminal = `'${value}' is not recognized as an internal command or external,
an executable program or a batch file`;
      }
    }
  }
}
</script>
