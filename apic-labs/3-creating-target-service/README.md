<h1>Creating an API using a target service</h1>

For this lab it is recommended to use chrome or firefox. You may have to allow popups.

**Things that will be covered**

- Creating an API using a Target Service.
- Securing our API using **Security Schemas**
- Creating a Product for our API.
- Testing our new API.

<h3>Creating API using Target Service</h3>

<p>Firstly Select API-Connect manager</p>

![step1](./images/api-connect/step1.png)

<p>Login using API Manager User Registry using the organisation credentials we created earlier</p>

![step2](./images/api-connect/step2.png)

<p>Once logged in click on develop API's and Products</p>

![step3](./images/api-connect/step3.png)

<p>Next click on Add and API</p>

![step4](./images/api-connect/step4.png)

<p>Click on From target service</p>

![step5](./images/api-connect/step5.png)

<p>Set the following options to: </p>

```
Title: Postcode
Base Path: /postcodes
Target Service URL: https://api.postcodes.io
```

![step6](./images/api-connect/step6.png)

<p>Keep the secure options as default</p>

![step7](./images/api-connect/step7.png)

<p>Next click Edit API</p>

![step8](./images/api-connect/step8.png)

<p>Click on hosts change the host to:</p>

```
${catalog.host}
```

![step9](./images/api-connect/step9.png)

<p>Go to base path and name the path to:</p>

```
{postcode}
```

![step10](./images/api-connect/step10.png)

<p>Next click the plus symbol to add a new operator to the path. Select the "Get" option.step</p>

![step11](./images/api-connect/step11.png)

<p>Next add a new parameter. To do this we will add a blank parameter and go back and fill it in later. When pressing submit it should look like the following.</p>

![step12](./images/api-connect/step12.png)

<p>Next go back and alter the parameter. Fill in the following options.</p>

```
Name: postcode
Required: tick
Located in: path
Type: string
```

![step13](./images/api-connect/step13.png)

<p>Select Gateway and then the invoke option </p>

![step14](./images/api-connect/step14.png)

<p>Once in the invoke section, change the URL to the following: </p>

```
$(target-url)$(request.path)
```

![step15](./images/api-connect/step15.png)

<p>Next go to the Test tab and select validate (a green tick should appear). Then select preferences.</p>

![step16](./images/api-connect/step16.png)

<p>Select the toggle "Auto-Publish"</p>

![step17](./images/api-connect/step17.png)

<p>Next go to the request header and select the target URL, it will be the one with the "{POSTCODE}" on the end. Then filll in the following: </p>

```
Key: postcode
Located In: Path
Value: SE17ND
```

![step18](./images/api-connect/step18.png)

<p>The following error may appear. Select open the server. Allow any pop ups and then close the window. Go back to the API manager and run the API again. </p>

![step19](./images/api-connect/step19.png)

<p>Once the API has been re-run the following output should appear</p>

![step20](./images/api-connect/step20.png)
