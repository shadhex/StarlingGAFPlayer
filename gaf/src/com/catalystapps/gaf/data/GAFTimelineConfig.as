package com.catalystapps.gaf.data
{
	import com.catalystapps.gaf.utils.MathUtility;
	import com.catalystapps.gaf.data.config.CAnimationFrames;
	import com.catalystapps.gaf.data.config.CAnimationObjects;
	import com.catalystapps.gaf.data.config.CAnimationSequences;
	import com.catalystapps.gaf.data.config.CStage;
	import com.catalystapps.gaf.data.config.CTextFieldObjects;
	import com.catalystapps.gaf.data.config.CTextureAtlasScale;

	import flash.geom.Point;
	import flash.geom.Rectangle;

	/**
	 * @private
	 */
	public class GAFTimelineConfig
	{
		//--------------------------------------------------------------------------
		//
		//  PUBLIC VARIABLES
		//
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//
		//  PRIVATE VARIABLES
		//
		//--------------------------------------------------------------------------
		private var _version: String;
		private var _stageConfig: CStage;

		private var _id: String;
		private var _assetID: String;

		private var _allTextureAtlases: Vector.<CTextureAtlasScale>;
		private var _textureAtlas: CTextureAtlasScale;

		private var _animationConfigFrames: CAnimationFrames;
		private var _animationObjects: CAnimationObjects;
		private var _animationSequences: CAnimationSequences;
		private var _textFields: CTextFieldObjects;

		private var _namedParts: Object;
		private var _linkage: String;

		private var _debugRegions: Vector.<GAFDebugInformation>;

		private var _warnings: Vector.<String>;
		private var _framesCount: uint;
		private var _bounds: Rectangle;
		private var _pivot: Point;

		//--------------------------------------------------------------------------
		//
		//  CONSTRUCTOR
		//
		//--------------------------------------------------------------------------

		public function GAFTimelineConfig(version: String)
		{
			this._version = version;

			_allTextureAtlases = new Vector.<CTextureAtlasScale>();

			_animationConfigFrames = new CAnimationFrames();
			_animationObjects = new CAnimationObjects();
			_animationSequences = new CAnimationSequences();
			_textFields = new CTextFieldObjects();
		}

		//--------------------------------------------------------------------------
		//
		//  PUBLIC METHODS
		//
		//--------------------------------------------------------------------------

		public function dispose(): void
		{
			for each(var cTextureAtlasScale: CTextureAtlasScale in this._allTextureAtlases)
			{
				cTextureAtlasScale.dispose();
			}
		}

		public function getTextureAtlasForScale(scale: Number): CTextureAtlasScale
		{
			for each(var cTextureAtlas: CTextureAtlasScale in this._allTextureAtlases)
			{
				if (MathUtility.equals(cTextureAtlas.scale, scale))
				{
					return cTextureAtlas;
				}
			}

			return null;
		}
		
		public function addWarning(text: String): void
		{
			if (!text)
			{
				return;
			}

			if (!this._warnings)
			{
				this._warnings = new Vector.<String>();
			}

			if (this._warnings.indexOf(text) == -1)
			{
				trace(text);
				this._warnings.push(text);
			}
		}
		
		public function getNamedPartID(name: String): String
		{
			for (var id: String in this._namedParts)
			{
				if (this._namedParts[id] == name)
				{
					return id;
				}
			}
			return null;
		}

		//--------------------------------------------------------------------------
		//
		//  PRIVATE METHODS
		//
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//
		// OVERRIDDEN METHODS
		//
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//
		//  EVENT HANDLERS
		//
		//--------------------------------------------------------------------------

		//--------------------------------------------------------------------------
		//
		//  GETTERS AND SETTERS
		//
		//--------------------------------------------------------------------------

		public function get textureAtlas(): CTextureAtlasScale
		{
			return this._textureAtlas;
		}

		public function set textureAtlas(textureAtlas: CTextureAtlasScale): void
		{
			this._textureAtlas = textureAtlas;
		}

		public function get animationObjects(): CAnimationObjects
		{
			return this._animationObjects;
		}

		public function set animationObjects(animationObjects: CAnimationObjects): void
		{
			this._animationObjects = animationObjects;
		}

		public function get animationConfigFrames(): CAnimationFrames
		{
			return this._animationConfigFrames;
		}

		public function set animationConfigFrames(animationConfigFrames: CAnimationFrames): void
		{
			this._animationConfigFrames = animationConfigFrames;
		}

		public function get animationSequences(): CAnimationSequences
		{
			return this._animationSequences;
		}

		public function set animationSequences(animationSequences: CAnimationSequences): void
		{
			this._animationSequences = animationSequences;
		}

		public function get textFields(): CTextFieldObjects
		{
			return this._textFields;
		}

		public function set textFields(textFields: CTextFieldObjects): void
		{
			this._textFields = textFields;
		}

		public function get allTextureAtlases(): Vector.<CTextureAtlasScale>
		{
			return this._allTextureAtlases;
		}

		public function set allTextureAtlases(allTextureAtlases: Vector.<CTextureAtlasScale>): void
		{
			this._allTextureAtlases = allTextureAtlases;
		}

		public function get version(): String
		{
			return this._version;
		}

		public function get debugRegions(): Vector.<GAFDebugInformation>
		{
			return this._debugRegions;
		}

		public function set debugRegions(debugRegions: Vector.<GAFDebugInformation>): void
		{
			this._debugRegions = debugRegions;
		}

		public function get warnings(): Vector.<String>
		{
			return this._warnings;
		}

		public function get id(): String
		{
			return this._id;
		}

		public function set id(value: String): void
		{
			this._id = value;
		}

		public function get assetID(): String
		{
			return this._assetID;
		}

		public function set assetID(value: String): void
		{
			this._assetID = value;
		}

		public function get namedParts(): Object
		{
			return this._namedParts;
		}

		public function set namedParts(value: Object): void
		{
			this._namedParts = value;
		}

		public function get linkage(): String
		{
			return _linkage;
		}

		public function set linkage(value: String): void
		{
			_linkage = value;
		}

		public function get stageConfig(): CStage
		{
			return _stageConfig;
		}

		public function set stageConfig(stageConfig: CStage): void
		{
			_stageConfig = stageConfig;
		}
		
		public function get framesCount(): uint
		{
			return _framesCount;
		}

		public function set framesCount(value: uint): void
		{
			_framesCount = value;
		}

		public function get bounds(): Rectangle
		{
			return _bounds;
		}

		public function set bounds(value: Rectangle): void
		{
			_bounds = value;
		}

		public function get pivot(): Point
		{
			return _pivot;
		}

		public function set pivot(value: Point): void
		{
			_pivot = value;
		}
	}
}
