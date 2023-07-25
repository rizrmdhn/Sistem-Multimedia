stop();


/* Click to Go to Scene and Play
Clicking on the specified symbol instance plays the movie from the specified scene and frame.

Instructions:
1. Replace "Scene 3" with the name of the scene you would like play.
2. Replace 1 with the frame number you would like the movie to play from in the specified scene.
*/

btn_play.addEventListener(MouseEvent.CLICK, fl_ClickToGoToScene);

function fl_ClickToGoToScene(event:MouseEvent):void
{
	MovieClip(this.root).gotoAndPlay(1, "Scene 1");
}
