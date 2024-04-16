import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

public class ConfluenceLogin {

    public static void main(String[] args) throws InterruptedException {
        // usr n pass
        String username = "90171626";
        String password = "0ef8Z4J5d00V51cW";

        // Path to ChromeDriver executable
        System.setProperty("webdriver.chrome.driver", "path_to_chromedriver.exe");

        // Initialize Chrome driver
        ChromeOptions options = new ChromeOptions();
        options.addArguments("--detach");
        WebDriver driver = new ChromeDriver(options);

        // Confluence Login page
        driver.get("https://172.18.134.83:8443/BSGUAT/servlet/BrowserServlet");
        Thread.sleep(5000);
        driver.findElement(By.id("details-button")).click();
        Thread.sleep(3000);
        driver.findElement(By.id("proceed-link")).click();
        Thread.sleep(3000);
        // find username/email field and send the username itself to the input field
        WebElement usernameField = driver.findElement(By.id("signOnName"));
        usernameField.sendKeys(username);
        Thread.sleep(3000);
        // find password input field and insert password as well
        WebElement passwordField = driver.findElement(By.id("password"));
        passwordField.sendKeys(password);
        Thread.sleep(3000);
        // click login button
        driver.findElement(By.id("sign-in")).click();
        Thread.sleep(3000);
        // wait the ready state to be complete
        // WebDriverWait wait = new WebDriverWait(driver, 10);
        // wait.until(ExpectedConditions.jsReturnsValue("return document.readyState === 'complete';"));
        Thread.sleep(3000);
        String errorMessage = "Incorrect username or password.";
        // get the errors (if there are)
        java.util.List<WebElement> errors = driver.findElements(By.cssSelector(".flash-error"));
        // if we find that error message within errors, then login is failed
        boolean loginSuccessful = errors.stream().noneMatch(e -> e.getText().contains(errorMessage));
        if (loginSuccessful) {
            System.out.println("[+] Login successful");
        } else {
            System.out.println("[!] Login failed");
        }
        driver.quit();
    }
}
