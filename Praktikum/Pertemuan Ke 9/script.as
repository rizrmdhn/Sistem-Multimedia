// Frame 2
var SelectQu:Number = 0;

var SeltUsedQu1:Number = 0;
var SeltUsedQu2:Number = 0;
var SeltUsedQu3:Number = 0;
var SeltUsedQu4:Number = 0;
var SeltUsedQu5:Number = 0;
var SeltUsedQu6:Number = 0;
var SeltUsedQu7:Number = 0;

var TotalQuest:Number = 6;

// Frame 4
import flash.events.MouseEvent;
stop();

var Points:Number = 0;

SelQu_btn.addEventListener(MouseEvent.CLICK, Select);

function Select(event:MouseEvent):void
{
	gotoAndStop(5);
}

// Frame 5
import flash.events.Event;

// select Random Number
var SelRam:Number = Math.random();
SelectQu = Math.round(SelRam*6+1); 

trace (SelectQu);

stage.addEventListener(Event.ENTER_FRAME,EntFrame);
function EntFrame(e:Event):void
{
	
	
	if (SelectQu == 1)
	{
		gotoAndStop("QuBk1");
		SelectQu = 0;
	}
	if (SelectQu == 2)
	{
		gotoAndStop("QuBk2");
		SelectQu = 0;
	}
	if (SelectQu == 3)
	{
		gotoAndStop("QuBk3");
		SelectQu = 0;
	}
	if (SelectQu == 4)
	{
		gotoAndStop("QuBk4");
		SelectQu = 0;
	}
	if (SelectQu == 5)
	{
		gotoAndStop("QuBk5");
		SelectQu = 0;
	}
	if (SelectQu == 6)
	{
		gotoAndStop("QuBk6");
		SelectQu = 0;
	}
	if (SelectQu == 7)
	{
		gotoAndStop("QuBk7");
		SelectQu = 0;
	}
}

// Frame 11
import flash.events.MouseEvent;
if (SeltUsedQu1 == 0)
{
	
	TotalQuest--;
	trace(TotalQuest);
	if (TotalQuest == 0)
	{
		gotoAndStop("TestOver");
	}

QuBk1True_btn.addEventListener(MouseEvent.CLICK, QuBk1True);

function QuBk1True(event:MouseEvent):void
{
	Points = Points + 20;
	SeltUsedQu1 =1;
	gotoAndStop(5);
}

QuBk1False_btn.addEventListener(MouseEvent.CLICK, QuBk1False);

function QuBk1False(event:MouseEvent):void
{
	SeltUsedQu1 =1;
	gotoAndStop(5);
}
points_txt.text = "You made a score of " + Points + ".";
}

else
{
	gotoAndPlay("Dup");
	
}

// Frame 21
import flash.events.MouseEvent;
if (SeltUsedQu2 == 0)
{
	
	TotalQuest--;
	trace(TotalQuest);
	if (TotalQuest == 0)
	{
		gotoAndStop("TestOver");
	}

QuBk2True_btn.addEventListener(MouseEvent.CLICK, QuBk2True);

function QuBk2True(event:MouseEvent):void
{
	Points = Points + 20;
	SeltUsedQu2 =1;
	gotoAndStop(5);
}

QuBk2FalseA_btn.addEventListener(MouseEvent.CLICK, QuBk2FalseA);

function QuBk2FalseA(event:MouseEvent):void
{
	SeltUsedQu2 =1;
	gotoAndStop(5);
}


points_txt.text = "You made a score of " + Points + ".";
}

else
{
	gotoAndPlay("Dup");
	
}

// Frame 31
import flash.events.MouseEvent;
if (SeltUsedQu3 == 0)
{
	
	TotalQuest--;
	trace(TotalQuest);
	if (TotalQuest == 0)
	{
		gotoAndStop("TestOver");
	}

QuBk3FalseA_btn.addEventListener(MouseEvent.CLICK, QuBk3FalseA);

function QuBk3FalseA(event:MouseEvent):void
{
	SeltUsedQu3 =1;
	gotoAndStop(5);
}

QuBk3True_btn.addEventListener(MouseEvent.CLICK, QuBk3True);

function QuBk3True(event:MouseEvent):void
{
	Points = Points + 20;
	SeltUsedQu3 =1;
	gotoAndStop(5);
}
points_txt.text = "You made a score of " + Points + ".";
}

else
{
	gotoAndPlay("Dup");
	
}

// Frame 41
import flash.events.MouseEvent;
if (SeltUsedQu4 == 0)
{
	TotalQuest--;
	trace(TotalQuest);
	if (TotalQuest == 0)
	{
		gotoAndStop("TestOver");
	}

QuBk4FalseA_btn.addEventListener(MouseEvent.CLICK, QuBk4FalseA);

function QuBk4FalseA(event:MouseEvent):void
{
	SeltUsedQu4 =1;
	gotoAndStop(5);
}

QuBk4True_btn.addEventListener(MouseEvent.CLICK, QuBk4True);

function QuBk4True(event:MouseEvent):void
{
	Points = Points + 20;
	SeltUsedQu4 =1;
	gotoAndStop(5);
}

points_txt.text = "You made a score of " + Points + ".";
}

else
{
	gotoAndPlay("Dup");
	
}

// Frame 51
import flash.events.MouseEvent;
if (SeltUsedQu5 == 0)
{
	TotalQuest--;
	trace(TotalQuest);
	if (TotalQuest == 0)
	{
		gotoAndStop("TestOver");
	}

QuBk5True_btn.addEventListener(MouseEvent.CLICK, QuBk5True);

function QuBk5True(event:MouseEvent):void
{
	Points = Points + 20;
	SeltUsedQu5 =1;
	gotoAndStop(5);
}

QuBk5False_btn.addEventListener(MouseEvent.CLICK, QuBk5False);

function QuBk5False(event:MouseEvent):void
{
	SeltUsedQu5 =1;
	gotoAndStop(5);
}
points_txt.text = "You made a score of " + Points + ".";
}

else
{
	gotoAndPlay("Dup");
	
}

// Frame 61
import flash.events.MouseEvent;
if (SeltUsedQu6 == 0)
{
	TotalQuest--;
	trace(TotalQuest);
	if (TotalQuest == 0)
	{
		gotoAndStop("TestOver");
	}

QuBk6True_btn.addEventListener(MouseEvent.CLICK, QuBk6True);

function QuBk6True(event:MouseEvent):void
{
	Points = Points + 20;
	SeltUsedQu6 =1;
	gotoAndStop(5);
}

QuBk6False_btn.addEventListener(MouseEvent.CLICK, QuBk6False);

function QuBk6False(event:MouseEvent):void
{
	SeltUsedQu6 =1;
	gotoAndStop(5);
}
points_txt.text = "You made a score of " + Points + ".";
}

else
{
	gotoAndPlay("Dup");
	
}

// Frame 71
import flash.events.MouseEvent;
if (SeltUsedQu7 == 0)
{
	TotalQuest--;
	trace(TotalQuest);
	if (TotalQuest == 0)
	{
		gotoAndStop("TestOver");
	}

QuBk7True_btn.addEventListener(MouseEvent.CLICK, QuBk7True);

function QuBk7True(event:MouseEvent):void
{
	Points = Points + 20;
	SeltUsedQu7 =1;
	gotoAndStop(5);
}

QuBk7False_btn.addEventListener(MouseEvent.CLICK, QuBk7False);

function QuBk7False(event:MouseEvent):void
{
	SeltUsedQu7 =1;
	gotoAndStop(5);
}
points_txt.text = "You made a score of " + Points + ".";
}

else
{
	gotoAndPlay("Dup");
	
}

// Frame 101
gotoAndStop(5);