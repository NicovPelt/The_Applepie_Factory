package;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.Lib;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.Assets;
import haxe.Timer;

/**
 * ...
 * @author Andor
 */
class ParticleSystem extends Sprite 
{
	var particle : Particle ;
	var particles : Array <Particle> = new Array <Particle>();
	
	public var particleSpawn_x : Float ;
	public var particleSpawn_y : Float ;
	
	//var wind : Float = -0.03 ;
	
	var wind : Float = Math.random() * -0.14 + 0.07 ;
	
	var framesPerPart:Int = 4;
	var frame:Int = 0;
	
	public function new(input:String) 
	{
		super();
	}
	
	function newParticle()
	{
		var newParticle:Particle = new Particle(this);
		newParticle.x = particleSpawn_x + Math.random () * 4 - 2;
		newParticle.y = particleSpawn_y + Math.random () * 4 - 2;
		newParticle.acc_x = wind;
		newParticle.acc_y = -0.04;
		newParticle.vel_x = Math.random() * 1 -.5;
		newParticle.vel_y = Math.random() * -2;
		newParticle.scaleX = 1 ;
		newParticle.scaleY = 1 ;
		newParticle.scale_inc = Math.random () * 0.003 + 0.01 ;
		newParticle.alpha = 0.5 ;
		newParticle.fadetime = -0.00455;
		newParticle.rotation = Math.random () * 360;
		
		
		particles.push(newParticle);
		addChildAt (newParticle,0);
	}

	public function update() 
	{
		
		if (frame < framesPerPart)
		{
			frame += 1;
		}
		else
		{
			newParticle ();
			frame = 0;
		}
		
		
		for (particle in particles)
		{
			particle.x += particle.vel_x;
			particle.y += particle.vel_y;
			particle.vel_x += particle.acc_x;
			particle.vel_y += particle.acc_y;
			particle.alpha += particle.fadetime;
			particle.scaleX += particle.scale_inc;
			particle.scaleY += particle.scale_inc;
			
		}
	}
	
}