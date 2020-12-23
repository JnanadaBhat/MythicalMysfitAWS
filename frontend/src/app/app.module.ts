import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppComponent } from './app.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { MysticalMysfitProfileGridComponent } from './mystical-mysfit-profile-grid/mystical-mysfit-profile-grid.component';
import { MythicalMysfitProfileService } from './services/mythical-mysfit-profile.service';

@NgModule({
  declarations: [AppComponent, MysticalMysfitProfileGridComponent],
  imports: [BrowserModule, NgbModule],
  providers: [MythicalMysfitProfileService],
  bootstrap: [AppComponent],
})
export class AppModule {}
