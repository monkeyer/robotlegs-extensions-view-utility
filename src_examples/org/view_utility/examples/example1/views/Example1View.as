package org.view_utility.examples.example1.views
{
	import flash.text.TextFieldAutoSize;
	import flash.text.AntiAliasType;
	import flash.text.TextField;
	import com.greensock.TweenMax;

	import org.robotlegs.mvcs.ComponentView;

	import flash.text.TextFormat;

	/**
	 * @author Peder A. Nielsen
	 */
	public class Example1View extends ComponentView
	{
		protected var headText:TextField;
		protected var dummyLipsumText:TextField;
		
		public function Example1View()
		{
			super();
		}
		
		override protected function initialize():void
		{
			this.x = 160;
			this.visible = false;
			this.alpha = 0;
			
			var headingTxtFormat:TextFormat = new TextFormat();
			headingTxtFormat.font = "copperplateGothicBold";
			headingTxtFormat.size = "14";
			
			var txtFormat:TextFormat = new TextFormat();
			txtFormat.font = "arial";
			txtFormat.size = "14";
			
			headText = new TextField();
			headText.defaultTextFormat = headingTxtFormat;
			headText.embedFonts = true;
			headText.antiAliasType = AntiAliasType.ADVANCED;
			headText.y = 20;
			
			dummyLipsumText = new TextField();
			dummyLipsumText.defaultTextFormat = txtFormat;
			dummyLipsumText.embedFonts = true;
			dummyLipsumText.antiAliasType = AntiAliasType.ADVANCED;
			dummyLipsumText.y = 50;
			dummyLipsumText.multiline = true;
			dummyLipsumText.wordWrap = true;
			dummyLipsumText.width = 350;
			dummyLipsumText.autoSize = TextFieldAutoSize.LEFT;
		}
		
		override public function animateIn():void
		{
			TweenMax.to(this, 1, {autoAlpha:1});
		}

		override public function animateOut():void
		{
			//Pass true to onAnimationOutStarted to add the new view to stage at animation out start
			//Need to call removeMe method at animation complete to remove view from display list
			TweenMax.to(this, 1, {autoAlpha:0, onStart:onAnimationOutStarted, onStartParams:[true], onComplete:removeMe});
			//or dispatch at animation complete to fade out this view before the next next view gets added to stage
			//TweenMax.to(this, 1, {autoAlpha:0, onComplete:onAnimationOutCompleted, onCompleteParams:[true]});
		}

	}
}
