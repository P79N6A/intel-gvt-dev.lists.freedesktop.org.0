Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp6746331ywo;
        Thu, 11 Apr 2019 03:47:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx+B42uVIC8qI/4w2l461+hMv7enblFhp0PTaUGwmOemO9hrgsiQWC/NREFTUwphD/ruusR
X-Received: by 2002:a63:cf11:: with SMTP id j17mr46134918pgg.252.1554979654389;
        Thu, 11 Apr 2019 03:47:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554979654; cv=none;
        d=google.com; s=arc-20160816;
        b=tTRvA1bsmdxvQ8Z3jOUUWOCHGEtCZGYGRo8sBTDmVn9tLKTjxcsA+SB7pRPTtmlfYb
         5l2ALmFhwYTcR8KQS60e6/cVqxfCZPlkrI5ssnPXipEn67J4wFxtdFu4zCZKisBe9vfx
         dMovAbwJ2EjEvz+jww8015rAk3MdQ5MsMbUugXAKMotSSMc9seETNkkfrvEoPxAlHZmi
         ZpPkhP7BE6fHbbBBTqXDGVdGRY926rPqVF7NGuQfBrVd9QlfQVVNP1X5VgO4fUCnIHgh
         +Q/hP+d9gAxmpPw/c8czqsGtVPenVKwoIVRnHQYVuoPgXXzBPIWJujmcpCQ1F658saFa
         5aTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=5lv84nudCdNkxUWLwVJvZNIP4chIJHMfeLwr3YHVhFs=;
        b=GqMf9BrcMvVgbZt1+MiacYa0XseXw82cWZL0Beo8LCCJI5Q3tTSm4masoeuix3RBIL
         n6ht9SFyD1QqxPnFAOwSnsh05CZNgaRZLuHoWNwVgb4hK2AkIM3ILZxrWO+1C025xwsV
         /m9MoluIAGKABB1C9UeNnEg3a24mNtAKCuqI0NypUFk4F7QLowC4XtTdg0hoztfvO7k1
         CZ8Wa3RJkVNbliFXY7zG3AVdwWXaepu+MgCgPIPDwPFnsEO2vCOVuyyegrrahrVO0Xww
         34GePdmG/xsPdhFqR0HokUM2mQxLhuq9dxjKINbvqq5N9AnhZFU3XtiP77btRHBIdWZV
         hVQg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id i6si33636408pgj.329.2019.04.11.03.47.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2019 03:47:34 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 085B1897F0;
	Thu, 11 Apr 2019 10:47:34 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72478897F0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 11 Apr 2019 10:47:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Apr 2019 03:47:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,337,1549958400"; d="scan'208";a="160715304"
Received: from aleksei-desktop.tm.intel.com ([10.237.55.101])
 by fmsmga004.fm.intel.com with ESMTP; 11 Apr 2019 03:47:31 -0700
From: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH V2 6/6] drm/i915/gvt: Check if get_next_pt_type() always
 returns a valid value
Date: Thu, 11 Apr 2019 13:46:31 +0300
Message-Id: <20190411104631.7627-7-aleksei.gimbitskii@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190411104631.7627-1-aleksei.gimbitskii@intel.com>
References: <20190411104631.7627-1-aleksei.gimbitskii@intel.com>
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
Cc: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Colin Xu <colin.xu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

QWNjb3JkaW5nIHRvIGd0dF90eXBlX3RhYmxlW10gZnVuY3Rpb24gZ2V0X25leHRfcHRfdHlwZSgp
IG1heSByZXR1cm5zCkdUVF9UWVBFX0lOVkFMSUQgaW4gc29tZSBjYXNlcy4gVG8gcHJldmVudCBk
cml2ZXIgdG8gdHJ5IHRvIGNyZWF0ZSBtZW1vcnkKcGFnZSB3aXRoIGludmFsaWQgZGF0YSB0eXBl
LCBhZGRpdGlvbmFsIGNoZWNrIGlzIGFkZGVkLgoKU2lnbmVkLW9mZi1ieTogQWxla3NlaSBHaW1i
aXRza2lpIDxhbGVrc2VpLmdpbWJpdHNraWlAaW50ZWwuY29tPgpDYzogWmhlbnl1IFdhbmcgPHpo
ZW55dXdAbGludXguaW50ZWwuY29tPgpDYzogWmhpIFdhbmcgPHpoaS5hLndhbmdAaW50ZWwuY29t
PgpDYzogQ29saW4gWHUgPGNvbGluLnh1QGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndnQvZ3R0LmMgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d2dC9ndHQuYwppbmRleCA5NWNkOGYyNWQ2ZjkuLmM5M2U3YTNhN2YzNiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d2dC9ndHQuYwpAQCAtMTA3OSw2ICsxMDc5LDkgQEAgc3RhdGljIHN0cnVjdCBp
bnRlbF92Z3B1X3BwZ3R0X3NwdCAqcHBndHRfcG9wdWxhdGVfc3B0X2J5X2d1ZXN0X2VudHJ5KAog
CX0gZWxzZSB7CiAJCWludCB0eXBlID0gZ2V0X25leHRfcHRfdHlwZSh3ZS0+dHlwZSk7CiAKKwkJ
aWYgKCFndHRfdHlwZV9pc19wdCh0eXBlKSkKKwkJCWdvdG8gZXJyOworCiAJCXNwdCA9IHBwZ3R0
X2FsbG9jX3NwdF9nZm4odmdwdSwgdHlwZSwgb3BzLT5nZXRfcGZuKHdlKSwgaXBzKTsKIAkJaWYg
KElTX0VSUihzcHQpKSB7CiAJCQlyZXQgPSBQVFJfRVJSKHNwdCk7Ci0tIAoyLjE3LjEKCi0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQpJbnRlbCBGaW5sYW5kIE95ClJlZ2lzdGVyZWQgQWRkcmVzczogUEwgMjgxLCAwMDE4
MSBIZWxzaW5raSAKQnVzaW5lc3MgSWRlbnRpdHkgQ29kZTogMDM1NzYwNiAtIDQgCkRvbWljaWxl
ZCBpbiBIZWxzaW5raSAKClRoaXMgZS1tYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgbWF5IGNvbnRh
aW4gY29uZmlkZW50aWFsIG1hdGVyaWFsIGZvcgp0aGUgc29sZSB1c2Ugb2YgdGhlIGludGVuZGVk
IHJlY2lwaWVudChzKS4gQW55IHJldmlldyBvciBkaXN0cmlidXRpb24KYnkgb3RoZXJzIGlzIHN0
cmljdGx5IHByb2hpYml0ZWQuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZApyZWNpcGllbnQs
IHBsZWFzZSBjb250YWN0IHRoZSBzZW5kZXIgYW5kIGRlbGV0ZSBhbGwgY29waWVzLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBt
YWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
