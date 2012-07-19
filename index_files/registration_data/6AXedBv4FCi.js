/*1341814089,169775559*/

if (window.CavalryLogger) { CavalryLogger.start_js(["e7OXL"]); }

__d("DOMEventListener",[],function(a,b,c,d,e,f){var g,h;if(window.addEventListener){g=function(j,k,l){j.addEventListener(k,l,false);};h=function(j,k,l){j.removeEventListener(k,l,false);};}else if(window.attachEvent){g=function(j,k,l){j.attachEvent('on'+k,l);};h=function(j,k,l){j.detachEvent('on'+k,l);};}var i={add:function(j,k,l){g(j,k,l);return {remove:function(){h(j,k,l);j=null;}};},remove:h};e.exports=i;});
__d("UnverifiedXD",["XD","XDUnverifiedChannel"],function(a,b,c,d,e,f){var g=b('XD').UnverifiedXD,h=c('XDUnverifiedChannel').channel;g.init({channelUrl:h});e.exports=g;});
__d("PluginResize",["Log","UnverifiedXD","bind","copyProperties","curry"],function(a,b,c,d,e,f){var g=b('Log'),h=b('UnverifiedXD'),i=b('bind'),j=b('copyProperties'),k=b('curry');function l(o){o=o||document.body;return o.offsetWidth+o.offsetLeft;}function m(o){o=o||document.body;return o.offsetHeight+o.offsetTop;}function n(o,p,event){this.calcWidth=o||l;this.calcHeight=p||m;this.width=undefined;this.height=undefined;this.event=event||'resize';}j(n.prototype,{resize:function(){var o=this.calcWidth(),p=this.calcHeight();if(o!==this.width||p!==this.height){g.debug('Resizing Plugin: (%s, %s, %s)',o,p,this.event);this.width=o;this.height=p;h.send({type:this.event,width:o,height:p});}return this;},auto:function(o){setInterval(i(this,this.resize),o||250);return this;}});n.auto=function(o,event,p){return new n(k(l,o),k(m,o),event).resize().auto(p);};n.autoHeight=function(o,p,event,q){return new n(function(){return o;},k(m,p),event).resize().auto(q);};e.exports=n;});
__d("PluginLoginButton",["DOMEventListener","DOMQuery","PluginResize","UserAgent","curry"],function(a,b,c,d,e,f){var g=b('DOMEventListener'),h=b('DOMQuery'),i=b('PluginResize'),j=b('UserAgent'),k=b('curry'),l={redirect:function(m){window.parent.location.replace(m);},submit:function(m){m.submit();},registration:function(m,n){g.add(m,'click',k(l.redirect,n));},connect:function(m,n){g.add(m,'click',k(l.submit,n));},resize:function(m){var n=j.firefox()||j.ie()>=9?1:0;new i(function(){return m.offsetWidth+n;}).resize().auto();},logoutListen:function(m,n){g.add(m,'click',k(l.submit,n));}};e.exports=l;});
__d("PluginOptin",["DOMEvent","DOMEventListener","PopupWindow","URI","bind","copyProperties"],function(a,b,c,d,e,f){var g=b('DOMEvent'),h=b('DOMEventListener'),i=b('PopupWindow'),j=b('URI'),k=b('bind'),l=b('copyProperties');function m(n){l(this,{return_params:j.getRequestURI().getQueryData(),login_params:{},optin_params:{},plugin:n});this.addReturnParams({ret:'optin'});delete this.return_params.hash;}l(m.prototype,{addReturnParams:function(n){l(this.return_params,n);return this;},addLoginParams:function(n){l(this.login_params,n);return this;},addOptinParams:function(n){l(this.optin_params,n);return this;},start:function(){var n=new j('/dialog/optin').addQueryData(this.optin_params).addQueryData({display:'popup',app_id:127760087237610,secure:j.getRequestURI().isSecure(),social_plugin:this.plugin,return_params:JSON.stringify(this.return_params),login_params:JSON.stringify(this.login_params)});this.popup=i.open(n.toString(),420,450);return this;}});m.starter=function(n,o,p,q){var r=new m(n);r.addReturnParams(o||{});r.addLoginParams(p||{});r.addOptinParams(q||{});return k(r,r.start);};m.listen=function(n,o,p,q,r){h.add(n,'click',function(s){new g(s).kill();m.starter(o,p,q,r)();});};e.exports=m;});
__d("PluginPerms",["DOMEvent","DOMEventListener","PopupWindow","URI","bind","copyProperties"],function(a,b,c,d,e,f){var g=b('DOMEvent'),h=b('DOMEventListener'),i=b('PopupWindow'),j=b('URI'),k=b('bind'),l=b('copyProperties');function m(n,o){l(this,{return_params:j.getRequestURI().getQueryData(),login_params:{},perms_params:{},perms:[],plugin:n,app:o});this.addReturnParams({ret:'perms'});delete this.return_params.hash;}l(m.prototype,{addReturnParams:function(n){l(this.return_params,n);},addLoginParams:function(n){l(this.login_params,n);},addPermsParams:function(n){l(this.perms_params,n);},addPerms:function(n){this.perms.push.apply(this.perms,n);},start:function(){var n=j('/dialog/plugin.perms').addQueryData(this.perms_params).addQueryData({display:'popup',app_id:this.app,perms:this.perms.join(','),secure:j.getRequestURI().isSecure(),social_plugin:this.plugin,return_params:JSON.stringify(this.return_params),login_params:JSON.stringify(this.login_params)});this.popup=i.open(n.toString(),210,450);}});m.starter=function(n,o,p,q,r,s){var t=new m(n,o);t.addReturnParams(q||{});t.addLoginParams(r||{});t.addPermsParams(s||{});t.addPerms(p||[]);return k(t,t.start);};m.listen=function(n,o,p,q,r,s,t){h.add(n,'click',function(u){new g(u).kill();m.starter(o,p,q,r,s,t)();});};e.exports=m;});
__d("PluginSend",["Arbiter","CSS","DOMDimensions","DOMPosition","DOMQuery","PluginOptin","UnverifiedXD","copyProperties"],function(a,b,c,d,e,f){var g=b('Arbiter'),h=b('CSS'),i=b('DOMDimensions'),j=b('DOMPosition'),k=b('DOMQuery'),l=b('PluginOptin'),m=b('UnverifiedXD'),n=b('copyProperties'),o='platform/socialplugins/dialog',p='platform/socialplugins/send/sent',q='platform/socialplugins/send/cancel',r=false,s=false,t={type:'presentEdgeCommentDialog',controllerID:'',widget_type:'send',nodeURL:'',width:400,height:300,query:{}},u={close:'dismissEdgeCommentDialog',show:'showEdgeCommentDialog',hide:'hideEdgeCommentDialog'},v={element:null,href:'',canpersonalize:false},w,x,y='';function z(){new l("send").addReturnParams({act:"send"}).start();}function aa(da){if(!v.canpersonalize)return z();if(typeof da!=='string')if(!r){da='open';}else if(s){da='hide';}else da='show';switch(da){case 'open':g.inform(o,{controllerID:y,event:da});r=s=true;var ea=i.getElementDimensions(x),fa=j.getElementPosition(x);t.anchorGeometry={x:ea.width,y:ea.height};t.anchorPosition={x:fa.x,y:fa.y};var ga=ba();t.query.anchorTargetX=ga.x;t.query.anchorTargetY=ga.y;m.send(t);break;case 'close':g.inform(o,{controllerID:y,event:da});r=s=false;break;case 'show':s=true;break;default:s=false;break;}h[s?'show':'hide'](w);h[s?'hide':'show'](x);if(da!=='open')m.send({type:u[da]});}function ba(){var da=k.find(x,'.pluginButtonIcon'),ea=j.getElementPosition(da),fa=i.getElementDimensions(da);return {y:ea.y+fa.width/2,x:ea.x+fa.height/2};}var ca={init:function(da){n(v,da);y=t.controllerID=v.element.id;t.nodeURL=v.href;w=k.find(v.element,'.pluginSendActive');x=k.find(v.element,'.pluginSendInactive');v.element.onclick=aa;g.subscribe(q,function(ea,fa){if(fa.controllerID===y)aa('hide');},g.SUBSCRIBE_NEW);g.subscribe(p,function(ea,fa){if(fa.controllerID===y)aa('close');},g.SUBSCRIBE_NEW);if(da.autosubmit)aa('open');}};a.Arbiter=g;e.exports=ca;});
__d("PluginXDReady",["Arbiter","UnverifiedXD"],function(a,b,c,d,e,f){var g=b('Arbiter'),h=b('UnverifiedXD'),i={handleMessage:function(j){if(!j.method)return;try{g.inform('Connect.Unsafe.'+j.method,JSON.parse(j.params),g.BEHAVIOR_PERSISTENT);}catch(k){}}};a.XdArbiter=i;h.send({xd_action:'plugin_ready',name:window.name});e.exports=null;});
__d("PluginShareButton",["DOMEvent","DOMEventListener","PluginResize","PopupWindow","UserAgent"],function(a,b,c,d,e,f){var g=b('DOMEvent'),h=b('DOMEventListener'),i=b('PluginResize'),j=b('PopupWindow'),k=b('UserAgent'),l={listen:function(m,n){var o=m.href;h.add(m,'click',function(p){new g(p).kill();j.open(o,340,670);});},resize:function(m){var n=k.firefox()||k.ie()>=9?1:0;new i(function(){return m.offsetWidth+m.offsetLeft+n;},function(){return m.offsetHeight+m.offsetTop;}).resize().auto();}};e.exports=l;});