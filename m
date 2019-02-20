Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp4200787ywa;
        Wed, 20 Feb 2019 00:48:06 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZEDFC1VqZZ9RlxUxLeXGlgMZlDzDUmtXSbXzT+z0xVk6IEXWhel5YNav4juYZ5lNP5Cbmm
X-Received: by 2002:a63:d814:: with SMTP id b20mr28540926pgh.312.1550652486806;
        Wed, 20 Feb 2019 00:48:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550652486; cv=none;
        d=google.com; s=arc-20160816;
        b=dJFxE8DIpwu2Jn5ncGiUVlICQCQcBO9Lw2oW5pSchveomYZM4zdQdGHTQFQTzoJDG6
         rHWGTxiu7GhktFxGn3vT0X1zp4LTka+vcpEnjyJoLkIgVq8iKdUMEZkGrLzbEaftvVBF
         paxhxm5jhJd0v5uOjf3dRvdqPi4yXC17bLtKcKI2ATUXFs9EItA0D8SGH3cHYtnXHlUT
         5RsDFaLGEpK307rfWrHdeRMEuCcbEZggZlRSr1A+8pphaLMMdD67B4kM3y3h4NzYd7WF
         JyiC7ukEDFSVpDfLnRiq+WmpSjN26+Er/2b7vfkbZLA2tcGcoP/bSF3FIFc47/C5ev52
         VXpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=OoBKUMLGNMlUIzpyMfHTlAPqUhe1kN+ZJMvcWptplJE=;
        b=S/CfRPk/EUqR55ph5HQ5Ks5jIhNQsS4vdrYga+4iKYbwR2RFeXPuN5Ra7kXAIJtEBB
         elkI45C2XFnSAoYLYzBbwnYwNyLxY9jHAyuylsh9dCBYqGzR29iqi7hf0yaT9gCA4Bbg
         1DqjYZpbwszulz+sSaWkw1dhwhsVSpwmb8oRQIekADBi5pWs5PHi81mrINW7xoPuiEsq
         0ACEFtNxeJLri2ovdkP4NYZo24UN4Xy7CEnR8x5gHnRSSd+xcthjJau8y7Ab21tTaCfR
         h/NRKIP5X0MecYyw3ZvFAknbjarJULtifrK66TgC7JHeCZDCYqsVJcQW9/70rJRr+LfU
         xV+w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id x29si17421465pgl.584.2019.02.20.00.48.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Feb 2019 00:48:06 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ADB789211;
	Wed, 20 Feb 2019 08:48:06 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A6A89165
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 20 Feb 2019 08:48:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DA0F07BDA9;
 Wed, 20 Feb 2019 08:48:02 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-228.ams2.redhat.com
 [10.36.116.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE9481001E78;
 Wed, 20 Feb 2019 08:47:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1DA4C11AB8; Wed, 20 Feb 2019 09:47:54 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] vfio/display: delay link up event
Date: Wed, 20 Feb 2019 09:47:53 +0100
Message-Id: <20190220084753.9130-4-kraxel@redhat.com>
In-Reply-To: <20190220084753.9130-1-kraxel@redhat.com>
References: <20190220084753.9130-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Wed, 20 Feb 2019 08:48:02 +0000 (UTC)
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Alex Williamson <alex.williamson@redhat.com>,
 intel-gvt-dev@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

S2ljayB0aGUgZGlzcGxheSBsaW5rIHVwIGV2ZW50IHdpdGggYSAwLjEgc2VjIGRlbGF5LApzbyB0
aGUgZ3Vlc3QgaGFzIGEgY2hhbmNlIHRvIG5vdGljZSB0aGUgbGluayBkb3duIGZpcnN0LgoKU2ln
bmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Ci0tLQogaW5jbHVk
ZS9ody92ZmlvL3ZmaW8tY29tbW9uLmggfCAgMSArCiBody92ZmlvL2Rpc3BsYXkuYyAgICAgICAg
ICAgICB8IDI2ICsrKysrKysrKysrKysrKysrKysrKysrLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDI0
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ody92
ZmlvL3ZmaW8tY29tbW9uLmggYi9pbmNsdWRlL2h3L3ZmaW8vdmZpby1jb21tb24uaAppbmRleCA1
ZjdmNzA5Yjk1Li5iNjVhMmYwNTE4IDEwMDY0NAotLS0gYS9pbmNsdWRlL2h3L3ZmaW8vdmZpby1j
b21tb24uaAorKysgYi9pbmNsdWRlL2h3L3ZmaW8vdmZpby1jb21tb24uaApAQCAtMTUxLDYgKzE1
MSw3IEBAIHR5cGVkZWYgc3RydWN0IFZGSU9EaXNwbGF5IHsKICAgICBzdHJ1Y3QgdmZpb19yZWdp
b25faW5mbyAqZWRpZF9pbmZvOwogICAgIHN0cnVjdCB2ZmlvX3JlZ2lvbl9nZnhfZWRpZCAqZWRp
ZF9yZWdzOwogICAgIHVpbnQ4X3QgKmVkaWRfYmxvYjsKKyAgICBRRU1VVGltZXIgKmVkaWRfbGlu
a190aW1lcjsKICAgICBzdHJ1Y3QgewogICAgICAgICBWRklPUmVnaW9uIGJ1ZmZlcjsKICAgICAg
ICAgRGlzcGxheVN1cmZhY2UgKnN1cmZhY2U7CmRpZmYgLS1naXQgYS9ody92ZmlvL2Rpc3BsYXku
YyBiL2h3L3ZmaW8vZGlzcGxheS5jCmluZGV4IDdiOWI2MDRhNjQuLjM2MTgyM2IyM2IgMTAwNjQ0
Ci0tLSBhL2h3L3ZmaW8vZGlzcGxheS5jCisrKyBiL2h3L3ZmaW8vZGlzcGxheS5jCkBAIC0zOCw2
ICszOCwyMSBAQAogICAgICAgICBnb3RvIGVycjsKIAogCitzdGF0aWMgdm9pZCB2ZmlvX2Rpc3Bs
YXlfZWRpZF9saW5rX3VwKHZvaWQgKm9wYXF1ZSkKK3sKKyAgICBWRklPUENJRGV2aWNlICp2ZGV2
ID0gb3BhcXVlOworICAgIFZGSU9EaXNwbGF5ICpkcHkgPSB2ZGV2LT5kcHk7CisgICAgaW50IGZk
ID0gdmRldi0+dmJhc2VkZXYuZmQ7CisKKyAgICBkcHktPmVkaWRfcmVncy0+bGlua19zdGF0ZSA9
IFZGSU9fREVWSUNFX0dGWF9MSU5LX1NUQVRFX1VQOworICAgIHB3cml0ZV9maWVsZChmZCwgZHB5
LT5lZGlkX2luZm8sIGRweS0+ZWRpZF9yZWdzLCBsaW5rX3N0YXRlKTsKKyAgICB0cmFjZV92Zmlv
X2Rpc3BsYXlfZWRpZF9saW5rX3VwKCk7CisgICAgcmV0dXJuOworCitlcnI6CisgICAgdHJhY2Vf
dmZpb19kaXNwbGF5X2VkaWRfd3JpdGVfZXJyb3IoKTsKK30KKwogc3RhdGljIHZvaWQgdmZpb19k
aXNwbGF5X2VkaWRfdXBkYXRlKFZGSU9QQ0lEZXZpY2UgKnZkZXYsIGJvb2wgZW5hYmxlZCwKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgcHJlZngsIGludCBwcmVmeSkK
IHsKQEAgLTUwLDYgKzY1LDcgQEAgc3RhdGljIHZvaWQgdmZpb19kaXNwbGF5X2VkaWRfdXBkYXRl
KFZGSU9QQ0lEZXZpY2UgKnZkZXYsIGJvb2wgZW5hYmxlZCwKICAgICAgICAgLnByZWZ5ID0gcHJl
ZnkgPzogdmRldi0+ZGlzcGxheV95cmVzLAogICAgIH07CiAKKyAgICB0aW1lcl9kZWwoZHB5LT5l
ZGlkX2xpbmtfdGltZXIpOwogICAgIGRweS0+ZWRpZF9yZWdzLT5saW5rX3N0YXRlID0gVkZJT19E
RVZJQ0VfR0ZYX0xJTktfU1RBVEVfRE9XTjsKICAgICBwd3JpdGVfZmllbGQoZmQsIGRweS0+ZWRp
ZF9pbmZvLCBkcHktPmVkaWRfcmVncywgbGlua19zdGF0ZSk7CiAgICAgdHJhY2VfdmZpb19kaXNw
bGF5X2VkaWRfbGlua19kb3duKCk7CkBAIC03Nyw5ICs5Myw4IEBAIHN0YXRpYyB2b2lkIHZmaW9f
ZGlzcGxheV9lZGlkX3VwZGF0ZShWRklPUENJRGV2aWNlICp2ZGV2LCBib29sIGVuYWJsZWQsCiAg
ICAgICAgIGdvdG8gZXJyOwogICAgIH0KIAotICAgIGRweS0+ZWRpZF9yZWdzLT5saW5rX3N0YXRl
ID0gVkZJT19ERVZJQ0VfR0ZYX0xJTktfU1RBVEVfVVA7Ci0gICAgcHdyaXRlX2ZpZWxkKGZkLCBk
cHktPmVkaWRfaW5mbywgZHB5LT5lZGlkX3JlZ3MsIGxpbmtfc3RhdGUpOwotICAgIHRyYWNlX3Zm
aW9fZGlzcGxheV9lZGlkX2xpbmtfdXAoKTsKKyAgICB0aW1lcl9tb2QoZHB5LT5lZGlkX2xpbmtf
dGltZXIsCisgICAgICAgICAgICAgIHFlbXVfY2xvY2tfZ2V0X21zKFFFTVVfQ0xPQ0tfUkVBTFRJ
TUUpICsgMTAwKTsKICAgICByZXR1cm47CiAKIGVycjoKQEAgLTE0MCw2ICsxNTUsOSBAQCBzdGF0
aWMgdm9pZCB2ZmlvX2Rpc3BsYXlfZWRpZF9pbml0KFZGSU9QQ0lEZXZpY2UgKnZkZXYpCiAgICAg
ICAgIHZkZXYtPmRpc3BsYXlfeXJlcyA9IGRweS0+ZWRpZF9yZWdzLT5tYXhfeXJlczsKICAgICB9
CiAKKyAgICBkcHktPmVkaWRfbGlua190aW1lciA9IHRpbWVyX25ld19tcyhRRU1VX0NMT0NLX1JF
QUxUSU1FLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZmaW9fZGlz
cGxheV9lZGlkX2xpbmtfdXAsIHZkZXYpOworCiAgICAgdmZpb19kaXNwbGF5X2VkaWRfdXBkYXRl
KHZkZXYsIHRydWUsIDAsIDApOwogICAgIHJldHVybjsKIApAQCAtMTU4LDYgKzE3Niw4IEBAIHN0
YXRpYyB2b2lkIHZmaW9fZGlzcGxheV9lZGlkX2V4aXQoVkZJT0Rpc3BsYXkgKmRweSkKIAogICAg
IGdfZnJlZShkcHktPmVkaWRfcmVncyk7CiAgICAgZ19mcmVlKGRweS0+ZWRpZF9ibG9iKTsKKyAg
ICB0aW1lcl9kZWwoZHB5LT5lZGlkX2xpbmtfdGltZXIpOworICAgIHRpbWVyX2ZyZWUoZHB5LT5l
ZGlkX2xpbmtfdGltZXIpOwogfQogCiBzdGF0aWMgdm9pZCB2ZmlvX2Rpc3BsYXlfdXBkYXRlX2N1
cnNvcihWRklPRE1BQnVmICpkbWFidWYsCi0tIAoyLjkuMwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50
ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
