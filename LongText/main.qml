import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 1.2

Window {
    id:rec1
    visible: true
    width: 640
    height: 480

    Flickable{
        id:flick1
        width: parent.width
        height: 600
        bottomMargin: 10
        contentHeight: textmain.height
        //contentWidth: parent.width
        //       interactive: true
        //       boundsBehavior: Flickable.StopAtBounds
        Text {
            id: textmain
            width: 580
            wrapMode: Text.Wrap
            //anchors.fill: parent
            anchors.centerIn: parent
            font.pointSize: 15

            text: "What happens in the book: After murdering Harry's parents, James and Lily Potter, evil Lord Voldemort puts a killing curse on Harry, then just a baby. The curse inexplicably reverses, defeating Voldemort and searing a lightning-bolt scar in the middle of the infant's forehead. Harry is then left at the doorstep of his boring but brutish aunt and uncle, the Dursleys.

   For 10 years, Harry lives in the cupboard under the stairs and is subjected to cruel mistreatment by Aunt Petunia, Uncle Vernon and their son Dudley. On his 11th birthday, Harry receives a letter inviting him to study magic at the Hogwarts School of Witchcraft and Wizardry.

   Harry discovers that not only is he a wizard, but he is a famous one. He meets two best friends, Ron Weasley and Hermione Granger, and makes his first enemy, Draco Malfoy. At Hogwarts the three friends are all placed into the Gryffindor house. Harry has a knack for the school sport, Quidditch, and is recruited onto the Gryffindor team as its star Seeker.

   Perusing the restricted section in the library, Harry discovers that the Sorcerer's Stone produces the Elixir of Life, which gives its drinker the gift of immortality. After realizing that Voldemort might be after the stone, Albus Dumbledore had it moved it to Hogwarts for safekeeping.

   Harry finds out that when she died, Lily Potter transferred to her son an ancient magical protection from Voldemort's lethal spells. This protection is what allowed Harry as an infant to survive Voldemort's attack. It also helps Harry keep Voldemort from possessing the Stone, which Dumbledore agrees to destroy.

   The Players:

   Albus Dumbledore: Headmaster of Hogwarts. He becomes Harry's mentor and father figure
   Ron Weasley: Harry's friend who comes from a large and economically struggling family
   Hermione Granger: Another friend of Harry's and a smart witch, though her parents are Muggles (non-magical folk)
   Draco Malfoy: Harry's nemesis. Comes from a lineage of wealthy wizards who not only support Voldemort, but also believe that magic should be performed by pure-bloods alone
   Rubeus Hagrid: Half-wizard, half-giant and Keeper of the Keys and Grounds. Develops a close friendship with Harry, Ron and Hermione
   Severus Snape: Professor of Potions. An unfair teacher to those he doesn't like. Has a strong dislike for and animosity toward Harry
   Lord Voldemort: A dark wizard. At one time the most powerful wizard, second only to Dumbledore

   The Magic Gadgets:

   Wands: Personalized sticks for performing magic
   Broomsticks: Primary means of transportation, also used in the game of Quidditch
   Invisibility cloak: A rare and expensive item that makes the wearer invisible. Harry inherits one from his father
   Remembrall: Clear orb that turns red if a wizard or witch has forgotten something
   Sorting Hat: Magically determines which house (Gryffindor, Hufflepuff, Ravenclaw, Slytherin) a new student is assigned to. The hat originally belonged to Godric Gryffindor, one of the four founders of Hogwarts
   Owls: Serve as mail messengers for wizards and witches
   "

        }

    }



}
