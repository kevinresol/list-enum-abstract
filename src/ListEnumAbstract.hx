import haxe.macro.Expr;
import haxe.macro.Context;

#if macro
using tink.MacroApi;
#end

class ListEnumAbstract {
	public static macro function list(e:Expr) {
		var t = Context.typeof(e);
		return switch Context.follow(t) {
			case TAbstract(_.get() => {meta: meta, impl: impl, name: name, module: module}, _) if(meta.has(':enum')):
			
				var statics = impl.get().statics.get();
				var path = ('$module.$name').split('.');
				var id = t.getID();
				var names = statics
					.filter(function(s) return s.kind.match(FVar(_)) && s.isPublic && s.type.getID() == id)
					.map(function(s) return macro $p{path.concat([s.name])});
				macro $a{names};
			default:
				Context.error('Only applicable to @:enum abstract', e.pos);
		}
	}
}