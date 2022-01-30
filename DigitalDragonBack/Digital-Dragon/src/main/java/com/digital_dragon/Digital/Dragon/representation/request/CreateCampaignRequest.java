package com.digital_dragon.Digital.Dragon.representation.request;

import com.google.firebase.database.annotations.NotNull;
import lombok.Data;

@Data
public class CreateCampaignRequest {
  @NotNull private String name;
  private String image;
  @NotNull private String email;
  private String history;
}
