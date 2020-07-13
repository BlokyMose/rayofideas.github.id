let sectionsEng = [
  "IMPERIAL MESSAGE<br>Franz Kafka",
  "The Emperor—so they say—has sent a message, directly from his death bed, to you alone, his pathetic subject, a tiny shadow which has taken refuge at the furthest distance from the imperial sun.",
  "He ordered the herald to kneel down beside his bed and whispered the message in his ear. He thought it was so important that he had the herald speak it back to him.",
  "He confirmed the accuracy of verbal message by nodding his head.",
  "And in front of the entire crowd of those witnessing his death—all the obstructing walls have been broken down, and all the great ones of his empire are standing in a circle on the broad and high soaring flights of stairs—in front of all of them he dispatched his herald.",

  "The messenger started off at once, a powerful, tireless man. Sticking one arm out and then another, he makes his way through the crowd.",
  "If he runs into resistance, he points to his breast where there is a sign of the sun. So he moves forwards easily, unlike anyone else.",
  "But the crowd is so huge; its dwelling places are infinite. If there were an open field, how he would fly along, and soon you would hear the marvellous pounding of his fist on your door.",
  //7
  "But instead of that, how futile are all his efforts. He is still forcing his way through the private rooms of the innermost palace. Never will he win his way through.",
  "And if he did manage that, nothing would have been achieved. He would have to fight his way down the steps, and, if he managed to do that, nothing would have been achieved.",
  "He would have to stride through the courtyards, and after the courtyards through the second palace encircling the first, and, then again, through stairs and courtyards, and then, once again, a palace, and so on for thousands of years.",
  "And if he finally burst through the outermost door—but that can never, never happen—the royal capital city, the centre of the world, is still there in front of him, piled high and full of sediment.",

  "No one pushes his way through here, certainly not someone with a message from a dead man.",
  "But you sit at your window and dream of that message when evening comes.",
  "End.<br>Presentation by: Raynhard M. Kemal"
];
let sectionsJpn =[
  "皇 帝 使 者 <br>フランツ・カフカ",
  "皇帝が――そう呼ばれているのだ――君という単独者、みすぼらしい臣下、皇帝という太陽から貧弱な姿で遠い遠いところへ逃がれていく影、そういう君に皇帝が臨終のベッドから伝言を送った。",
  "皇帝は使者をベッドのそばにひ ざまずかせ、その耳にその伝言の文句をささやいた。皇帝にとってはその伝言がひどく大切だったので、使者にそれを自分の耳へ復誦させたのだった。",
  "うなずいて見せることで、皇帝はその復誦の言葉の正しさを裏書きした。",
  "そして、自分の死に立ち会っている全員を前にして――障害となる四方の壁は打ちこわされ、ひろびろとのび、高くまでつづいている宮殿前の階段の上には、帝国の高官たちが輪形をつくって立っている――、こうしたすべての者を前にして皇帝は使者を派遣した。",

  "使者はすぐ途についた。力強い、疲れを知らぬ男だ。あるいは右腕、あるいは左腕と前にのばしながら、群集のあいだに自分の道を切り開いていった。",
  "抵抗する者がいると、彼は自分の胸を指さした。その胸の上には太陽のしるしがついている。彼はそうやってまた、ほかのどんな人間にもできないほどたやすく前進していくことができた。",
  "だが、群集はあまりにも多かった。彼らの住居は果てしなくつづいていた。ひろびろとした野原がひらけているならば、使者はどんなに飛ぶように走ったことだろう。そして、やがて君はきっと彼の拳が君の戸口をたたくすばらしい音を聞いたことだろう。",

  "ところが、そんなことにはならないで、彼はなんと無益に骨を折っていることだろう。いつまでたっても彼は宮殿の奥深くの部屋部屋をなんとかしてかけ抜けようとするのだ。だが、けっしてその部屋部屋を抜けきることはないだろう。",
  "そして、もしうまくかけ抜けたとしても、何一つ得るところはないだろう。つぎにはなんとかして階段をかけ下りようとしなければならないだろう。そして、その階段をうまくかけ下りることができても、何一つ得るところはないだろう。",
  "いくつもの内庭を越えていかなければならぬのだ。そして、かずかずの内庭のつぎには第二の壮大な宮殿がくる。それからふたたび、階段と内庭だ。それからまた宮殿だ。そういうことをくり返して何千年たっても終わることはない。",
  "そして、とうとういちばん外側の門から走り出たところで――だが、けっして、けっして、そんなことは起こるはずがない――やっと彼の前には首都が横たわっているのだ。",

  "その首都こそ世界の中央であり、世界の沈澱物で高く積み上げられている。だれ一人としてここをかけ抜けることはできないし、まして死者のたよりをたずさえてかけ抜けることはできない。",
  "だが君は、夕べが訪れると、君の窓辺に坐り、心のなかでそのたよりを夢想するのだ。",
  ""
];

let indexSection = 0;
let scroll;
let narrativeEng;
let narrativeJpn;
let indexBody;
let indexBodyDark;
let indexHeader;
let indexFooter;
let isScrollable = true;
let scrollSpeed = 50;
let scrollAlpha =0.4;
function Init(){
  SetNarration();
  scroll= document.getElementById("index-main-scroll-bar");
  narrativeEng= document.getElementById("index-narrative-eng");
  narrativeJpn= document.getElementById("index-narrative-jpn");
  indexBody= document.getElementById("index-body");
  indexBodyDark= document.getElementById("index-body-dark");
  indexHeader = document.getElementById("index-header");
  indexFooter = document.getElementById("index-footer");

  scroll.style.width=(window.screen.width/3).toString()+"px";
}

window.addEventListener("wheel", event => {

  if(isScrollable==true){
      const delta = Math.sign(event.deltaY);
      // let scroll= document.getElementById("index-main-scroll-bar");
      let scrollWidth= scroll.computedStyleMap().get('width');
      scroll.style.width= (parseInt(scrollWidth)+delta*-scrollSpeed).toString()+"px";
      scroll.style.backgroundColor= 'rgba(255,255,255,'+(scrollAlpha+delta*-0.075).toString()+')';

      //scroll bar hits border
      if(parseInt(scroll.computedStyleMap().get('width'))>=window.screen.width-100){
        if(indexSection<sectionsEng.length-1){
        isScrollable = false;
        narrativeEng.style.color = "rgba(255,255,255,0)";
        narrativeJpn.style.color = "rgba(255,255,255,0)";

        scroll.style.transition = "width 0.8s ease-in-out";
        //reset width
        scrollAlpha=0.4;
        scroll.style.width= (window.screen.width/3).toString()+"px" ;
          indexSection++;
          var timer = setInterval(function(){
            isScrollable=true;
            UIChange();
            narrativeEng.style.color = "rgba(255,255,255,1)";
            narrativeJpn.style.color = "rgba(255,255,255,1)";
            SetNarration();
            clearInterval(timer);
          },2000);
        }
        //prevent error
        else{
          scroll.style.width= (window.screen.width-200).toString()+"px" ;
          isScrollable=true;
        }
      }
      else if(parseInt(scroll.computedStyleMap().get('width'))<=50){
        if(indexSection>0){
        isScrollable = false;
        narrativeEng.style.color = "rgba(255,255,255,0)";
        narrativeJpn.style.color = "rgba(255,255,255,0)";

        scroll.style.transition = "width 0.8s ease-in-out";
        //reset width
        scrollAlpha=0.4;
        scroll.style.width= (window.screen.width/3).toString()+"px" ;
          indexSection--;
          var timer = setInterval(function(){
            isScrollable=true;
            UIChange();
            narrativeEng.style.color = "rgba(255,255,255,1)";
            narrativeJpn.style.color = "rgba(255,255,255,1)";
            SetNarration();
            clearInterval(timer);
          },2000);
        }
        //prevent error
        else{
          scroll.style.width= "150px";
          isScrollable=true;

        }

      }
    }

});

function UIChange(){
switch (indexSection) {
  case 0:
    indexHeader.style.opacity = 0;
    indexFooter.style.opacity = 1;
    narrativeEng.style.fontSize = "56px";
    narrativeEng.style.fontFamily = "fahkwang";
    narrativeEng.style.lineHeight = "70pt";
    scroll.style.transition = "width 0s ease-in-out";
    break;
  case 1:
    indexHeader.style.opacity = 1;
    indexFooter.style.opacity =0;
    narrativeEng.style.fontSize = "28px";
    narrativeEng.style.fontFamily = "sawarbi";
    narrativeEng.style.lineHeight = "35pt";
    scroll.style.transition = "width 0s ease-in-out";
    break;
  case 8:
    scroll.style.transition = "width 0.3s ease-in-out";
    indexBodyDark.style.opacity = 0.5;
    break;
  case 9:
    scroll.style.transition = "width 0.4s ease-in-out";
    break;
  case 10:
    scroll.style.transition = "width 0.5s ease-in-out";
    indexBodyDark.style.opacity = 1;
    break;
  case 11:
    scroll.style.transition = "width 0.5s ease-in-out";
    break;
  default:
    scroll.style.transition = "width 0s ease-in-out";
    break;

}
}

function SetNarration(){
  document.getElementById("index-narrative-eng").innerHTML = sectionsEng[indexSection];
  document.getElementById("index-narrative-jpn").innerHTML = sectionsJpn[indexSection];
}

function startTimer(duration, display) {
    var timer = duration, minutes, seconds;
    setInterval(function () {
        minutes = parseInt(timer / 60, 10);
        seconds = parseInt(timer % 60, 10);

        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

        display.textContent = minutes + ":" + seconds;

        if (--timer < 0) {
            timer = duration;
        }
    }, 1000);
}

function showNarrative(lang){
  switch(lang){
    case("eng"):
    narrativeEng.style.fontSize = "28px";
    narrativeEng.style.color = "rgba(255,255,255,1)";
    narrativeJpn.style.fontSize = "0px";
    narrativeJpn.style.color = "rgba(0,0,0,0)";
    break;
    case("jpn"):
    narrativeJpn.style.fontSize = "28px";
    narrativeJpn.style.color = "rgba(255,255,255,1)";
    narrativeEng.style.fontSize = "0px";
    narrativeEng.style.color = "rgba(0,0,0,0)";
    break;
    case("all"):
    narrativeJpn.style.fontSize = "28px";
    narrativeJpn.style.color = "rgba(255,255,255,1)";
    narrativeEng.style.fontSize = "28px";
    narrativeEng.style.color = "rgba(255,255,255,1)";
    break;
  }
}
