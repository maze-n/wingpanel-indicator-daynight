/*
 * Copyright (c) 2019 mazen ()
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Library General Public License as published by
 * the Free Software Foundation, either version 2.1 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * Authored by: mazen <mmaz999@outlook.com>
 */

public class Daynight.Indicator : Wingpanel.Indicator {
    private Gtk.Grid main_grid;
    private Gtk.Image display_icon;

    public Indicator () {
        Object (code_name: "",
                display_name: _("indicator-daynight"),
                description:_("A wingpanel indicator to toggle 'prefer dark variant' option in Elementary OS."));
    }

    construct {
        display_icon = new Gtk.Image.from_icon_name ("display-brightness-symbolic", Gtk.IconSize.LARGE_TOOLBAR);

        var toggle_switch = new Wingpanel.Widgets.Switch ("Prefer dark variant");

        var restart_button = new Gtk.ModelButton();
        restart_button.text = "Restart panel and dock";

        main_grid = new Gtk.Grid();
        main_grid.attach(toggle_switch, 0, 0);
        main_grid.attach(new Wingpanel.Widgets.Separator (), 0, 1);
        main_grid.attach(restart_button, 0, 2);

        this.visible = true;

        toggle_switch.notify["active"].connect (() => {
            display_icon.set_from_icon_name (toggle_switch.active ? "weather-clear-night-symbolic" : "display-brightness-symbolic", Gtk.IconSize.LARGE_TOOLBAR);
        });
        
    }

    public override Gtk.Widget get_display_widget () {
        return display_icon;
    }

    public override Gtk.Widget? get_widget () {
        if (main_grid == null) {
            main_grid = new Gtk.Grid ();
            main_grid.set_orientation (Gtk.Orientation.VERTICAL);
            
            main_grid.show_all ();
        }

        return main_grid;
    }

    public override void opened () { }

    public override void closed () { }
}

public Wingpanel.Indicator? get_indicator (Module module, Wingpanel.IndicatorManager.ServerType server_type) {
    // Temporal workarround for Greeter crash
    if (server_type != Wingpanel.IndicatorManager.ServerType.SESSION) {
        return null;
    }
    debug ("Activating daynight widget");
    var indicator = new Daynight.Indicator ();
    return indicator;
}
