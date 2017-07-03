CounterFab Binding for Xamarin
=============================

Xamarin bindings library for the Android [CounterFab library](https://github.com/andremion/CounterFab).

Plugin is available on [Nuget](https://www.nuget.org/packages/Xamarin.Bindings.CounterFab/).

Installation
------------
    Install-Package Xamarin.Bindings.CounterFab

Usage
-----
For details, please see the [original CounterFab documentation](https://github.com/andremion/CounterFab).
```xml
<com.andremion.counterfab.CounterFab
        android:id="@+id/counter_fab"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:src="@drawable/ic_add_white_24dp" />
```
```csharp
var counterFab = this.FindViewById<CounterFab>(Resource.Id.counter_fab);

counterFab.Count = 10; // Set the count value to show on badge
counterFab.Increase(); // Increase the current count value by 1
counterFab.Decrease(); // Decrease the current count value by 1
```
Build
-----
To automatically download the latest AAR, update the version information in AssemlyInfo.cs and the nuspec file and then build and package the binding assembly, just run `build.bat` in the Visual Studio Developer Command Prompt.

License
--------

    Copyright 2017 Munir Husseini

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
