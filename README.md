# hamonikr-plymouth-theme-hanla

하모니카 plymouth Theme - hanla

## Install

```
sudo ./install
```

## Test
```
sudo ./test.sh
```

# License
[LICENSE](LICENSE)

# FAQ

plymouth module 이 없어서 제대로 실행되지 않는 문제를 해결하는 방법
> https://askubuntu.com/questions/775301/unable-to-use-a-custom-splash-screen-in-ubuntu-16-04lts

```
sudo apt install --reinstall  plymouth-themes
```

## plymouth two-step module sources 

ref : https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/desktop_migration_and_administration_guide/plymouth

아래 소스코드를 보면 애니메이션으로 사용되는 `animation-` 과 `progress-` 그리고 `throbber-` 이미지들이 재생되는 것을 알 수 있다.

https://github.com/sergeysova/plymouth/blob/master/src/plugins/splash/two-step/plugin.c

```
static view_t *
view_new (ply_boot_splash_plugin_t *plugin,
          ply_pixel_display_t      *display)
{
        view_t *view;

        view = calloc (1, sizeof(view_t));
        view->plugin = plugin;
        view->display = display;

        view->entry = ply_entry_new (plugin->animation_dir);
        view->end_animation = ply_animation_new (plugin->animation_dir,
                                                 "animation-");
        view->progress_animation = ply_progress_animation_new (plugin->animation_dir,
                                                               "progress-");

        view->throbber = ply_throbber_new (plugin->animation_dir,
                                           "throbber-");
        ply_progress_animation_set_transition (view->progress_animation,
                                               plugin->transition,
                                               plugin->transition_duration);

        view->label = ply_label_new ();
        view->message_label = ply_label_new ();

        return view;
}
```