use leptos::*;
use leptos_meta::*;
use leptos_router::*;
use sysinfo::{CpuExt, System, SystemExt};

#[component]
pub fn App(cx: Scope) -> impl IntoView {
    // Provides context that manages stylesheets, titles, meta tags, etc.
    provide_meta_context(cx);

    view! {
        cx,

        // injects a stylesheet into the document <head>
        // id=leptos means cargo-leptos will hot-reload this stylesheet
        <Stylesheet id="leptos" href="/pkg/leptos_start.css"/>

        // sets the document title
        <Title text="Welcome to Leptos"/>

        // content for this welcome page
        <Router>
            <main>
                <Routes>
                    <Route path="" view=|cx| view! { cx, <Body/> }/>
                </Routes>
            </main>
        </Router>
    }
}

#[component]
fn Body(cx: Scope) -> impl IntoView {
    let sys = System::new();

    let (cpu, set_cpu) = create_signal(cx, 0);

    let cpu_state: i32 = sys.cpus()[0].cpu_usage() as i32;

    let on_click = move |_| set_cpu.update(|cpu| *cpu = cpu_state);

    view! { cx,
        <button on:click=on_click>"Click Me: " {cpu}</button>
    }
}