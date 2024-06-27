-- $Name: Трусы и часы$
-- $Version: 2.0$
-- $Author: Лукиук$
-- $Info: Tест игроков$
require "dbg"
require "fmt" -- некоторые функции форматирования
require "noinv" 
require "snd"
fmt.para = true -- включить режим параграфов (отступы)

game.act = 'Не ясно.';
game.use = 'Не, не то.';
game.inv = 'Что же делать?';

biba = player {
    nam = 'Биба';
    room = 'main';
}

boba = player {
    nam = 'Боба';
    room = 'main';
}

function init() -- добавим в инвентарь нож и бумагу
 change_pl('Биба')
 place("bibody", 'main')
 place("bobody", 'main') 
 lifeon ("bibody")
 lifeon ("bobody")
end

obj {
 nam = 'кнопка';
	dsc = 'На стене есть {кнопка}.';
	use = 'Отличная идея!';
 act = function(s)
		p (me().nam, " стал ") 
	 if me().nam == 'Биба' then change_pl('Боба') p (me().nam) return end;
	 if me().nam == 'Боба' then change_pl('Биба') p (me().nam) return end;
	end;
};

obj {
 nam = 'трусы';
	dsc = 'На столе лежат {трусы}.';
	inv = 'В синий горошек!';
	tak = function(s)
		p (me().nam, ' взял трусы!');
	end;
	use = 'Отличная идея!';
 act = function(s)
 end;
};


obj {
 nam = 'галстук';
	dsc = 'На трюмо лежит {галстук}.';
	inv = 'Тёмно-синий. Нестареющая классика!';
	tak = function(s)
		p (me().nam, ' взял галстук!');
	end;
	use = 'Отличная идея!';
 act = function(s)
 end;
};

obj {
 nam = 'носки';
 dsc = 'На столе лежат {носки}.';
	inv = 'Полосатые!';
	tak = function(s)
		p (me().nam, ' взял носки!');
	end;
	use = 'Отличная идея!';
 act = function(s)
 end;
};

obj {
 nam = 'шляпа';
 dsc = 'На столе лежит {шляпа}.';
	inv = 'Нуарный шик!';
	tak = function(s)
		p (me().nam, ' взял шляпу!');
	end;
	use = 'Отличная идея!';
 act = function(s)
 end;
};

obj {
 nam = 'часы';
 dsc = 'На столе лежат {часы}.';
	inv = 'Антикварная вещица!';
	tak = function(s)
		p (me().nam, ' взял часы!');
	end;
	use = 'Отличная идея!';
 act = function(s)
 end;
};

obj {
 nam = 'усы';
 dsc = 'На трюмо лежат {усы}.';
	inv = 'Театральные, из шерсти буйвола.';
	tak = function(s)
		p (me().nam, ' взял усы!');
	end;
	use = 'Отличная идея!';
 act = function(s)
 end;
};

obj {
 nam = 'кошелёк';
 dsc = 'На трюмо лежит {кошелёк}.';
	inv = 'Деньги, денежки!!!';
	tak = function(s)
		p (me().nam, ' взял кошелёк!');
	end;
	use = 'Отличная идея!';
 act = function(s)
 end;
};

obj {
 nam = 'bibody';
 disp = 'Биба';
 dsc = function (s)
		local inv_dsc = "У Бибы ничего нет."
		if me().nam == "Боба" then
			local i = #biba:inventory()
			if i > 0 then
				inv_dsc = "У Бибы есть "
				for k, v in ipairs(biba:inventory()) do
					inv_dsc = inv_dsc..v.nam
					if k + 1 > i then inv_dsc = inv_dsc.."."
					elseif k + 2 > i then inv_dsc = inv_dsc.." и "
					else inv_dsc = inv_dsc..", "
					end
				end
			else inv_dsc = "У Бибы ничего нет."
			end
			return	('На столе лежит {Биба}. '..inv_dsc);
		end
	end;
	inv = 'Деньги, денежки!!!';
	use = 'Отличная идея!';
	used = function(s,w)
		place(w, biba)
	end;
 act = function(s)
 end;
 life = function(s)
		if me().nam == "Биба" then
			if player_moved() then
				place(s);
			end
  end
 end;
};

obj {
 nam = 'bobody';
 disp = 'Боба';
 dsc = function (s)
		local inv_dsc = "У Бобы ничего нет."
		if me().nam == "Биба" then
			local i = #boba:inventory()
			if i > 0 then
				inv_dsc = "У Бобы есть "
				for k, v in ipairs(boba:inventory()) do
					inv_dsc = inv_dsc..v.nam
					if k + 1 > i then inv_dsc = inv_dsc.."."
					elseif k + 2 > i then inv_dsc = inv_dsc.." и "
					else inv_dsc = inv_dsc..", "
					end
				end
			else inv_dsc = "У Бобы ничего нет."
			end
			return	('На трюмо лежит {Боба}. '..inv_dsc);
		end
	end;
	inv = 'Деньги, денежки!!!';
	use = 'Отличная идея!';
	used = function(s,w)
		place(w, boba)
	end;
 act = function(s)
 end;
 life = function(s)
		if me().nam == "Боба" then
			if player_moved() then
				place(s);
			end
  end
 end;
};

room {
    nam = 'main';
    title = 'Первая комната';
    disp = 'В первую комнату';
    dsc = 'Комната с ничем и кое-чем.';
    obj = { 'трусы', 'носки', 'часы', 'кнопка'  };
    way = {  'niam'  };
}


room {
    nam = 'niam';
    title = 'Вторая комната';
    disp = 'Во вторую комнату';
    dsc = 'Комната с ничем и кое-чем.';
    obj = { 'усы', 'кошелёк', 'кнопка', 'шляпа', 'галстук'  };
    way = {  'main'  };
}
