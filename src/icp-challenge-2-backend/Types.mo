module Types {

  public type Timestamp = Nat64;

  // Define the Type that describes the Request arguments for an HTTPS outcall.
  public type HttpRequestArgs = {
      url : Text;
      max_response_bytes : ?Nat64;
      headers : [HttpHeader];
      body : ?[Nat8];
      method : HttpMethod;
      transform : ?TransformRawResponseFunction;
  };

  public type HttpHeader = {
      name : Text;
      value : Text;
  };

  public type HttpMethod = {
      #get;
      #post;
      #head;
  };

  public type HttpResponsePayload = {
      status : Nat;
      headers : [HttpHeader];
      body : [Nat8];
  };

  // HTTPS outcalls have an optional "transform" key. These two types help describe it.
  public type TransformRawResponseFunction = {
      function : shared query TransformArgs -> async HttpResponsePayload;
      context : Blob;
  };

  // Define the arguments the transform function needs.
  public type TransformArgs = {
      response : HttpResponsePayload;
      context : Blob;
  };

  public type CanisterHttpResponsePayload = {
      status : Nat;
      headers : [HttpHeader];
      body : [Nat8];
  };

  public type TransformContext = {
      function : shared query TransformArgs -> async HttpResponsePayload;
      context : Blob;
  };

  // Lastly, declare the management canister which you use to make the HTTPS outcall.
  public type IC = actor {
      http_request : HttpRequestArgs -> async HttpResponsePayload;
  };

  // New type to represent the structure of the GitHub User API response.
  public type GitHubUser = {
      login : Text;
      id : Nat;
      node_id : Text;
      avatar_url : Text;
      gravatar_id : Text;
      url : Text;
      html_url : Text;
      followers_url : Text;
      following_url : Text;
      gists_url : Text;
      starred_url : Text;
      subscriptions_url : Text;
      organizations_url : Text;
      repos_url : Text;
      events_url : Text;
      received_events_url : Text;
      type_ : Text;
      site_admin : Bool;
      name : ?Text;
      company : ?Text;
      blog : ?Text;
      location : ?Text;
      email : ?Text;
      hireable : ?Bool;
      bio : ?Text;
      twitter_username : ?Text;
      public_repos : Nat;
      public_gists : Nat;
      followers : Nat;
      following : Nat;
      created_at : Text;
      updated_at : Text;
  };

}
