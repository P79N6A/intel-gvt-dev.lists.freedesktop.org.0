Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp520502ywe;
        Thu, 21 Feb 2019 09:35:46 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ib2CQbafuZn+l6DpzHAzQyuGUmCY6G2GZN+5ehbDC7p+4kwGpgq9M8jcOMR5gkCTBz59ayW
X-Received: by 2002:a63:4652:: with SMTP id v18mr22298686pgk.356.1550770546473;
        Thu, 21 Feb 2019 09:35:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550770546; cv=none;
        d=google.com; s=arc-20160816;
        b=tPkMoYiSA7NTGbFf1OZYRVnZQP/o7MArzor3lUcjIb3us7YHtsqsYkkvUoZVZSXvNl
         k0baBCYhHWZjEhDHUq0iE8oB7DdWXdvy0loxsWGcEH25lWOV9DhWftep2EPgpeUR8bux
         l0qNBDIox63Ixr6dQlxwMnEAqtWQw+diyEUsMvqVKO/l91jTHtqAZaEXeib9mG+uDgwi
         WOWR/OQOXeXCBzLDe481YC208mXojw5EqXXR5FEBZxjInBm5u4whpVQzY77O/dvDFb5V
         FoFV/Gqb9eLESnAAZgmC+l9L1/lQnX4jvSE06+bo/g+6vIXOWI7GZQJ0OdV4rLpaB9WD
         JiCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:references:in-reply-to:message-id:subject
         :to:from:date:delivered-to;
        bh=1m4KxOqjt5YEU53rjU/X/yffRfXafi4lL0a+Jwa60lg=;
        b=c/fU3BReS+2B467AlRdeeHvFzB2UMN3r1LmOClYC5Mr1pmkMdqAfYXFUE0L0et4DQe
         kqF8iqDU5g8FTRL4McJnlIy+aKGBgBAusf0GjtyKABnr9sjskzAy+V8apnyqk3SWJupZ
         Xg0FXitSyCvVzqUXMPUe8gFIUw7yP1pLzZy+EmBM99KVzWN9CO3akJFDvuSZdcsDRGvD
         h6AwWiURE76SanCzEtCvjHyDE9JeFwruilYNykoXUaiVHlyHoIL0o8vEGPt3S/WXrxBt
         ZxNbxaIXuK1JsE4W2YgYBISluDPEDBd9UBTsqC/wRKqMqFDTA5rMECCkJNimIWcVZB6n
         R5Hg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id v6si7760210pgr.191.2019.02.21.09.35.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Feb 2019 09:35:46 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F588975F;
	Thu, 21 Feb 2019 17:35:46 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D3EB8975F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 21 Feb 2019 17:35:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1389FC057F40;
 Thu, 21 Feb 2019 17:35:45 +0000 (UTC)
Received: from w520.home (ovpn-116-24.phx2.redhat.com [10.3.116.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C9A295C297;
 Thu, 21 Feb 2019 17:35:41 +0000 (UTC)
Date: Thu, 21 Feb 2019 10:35:36 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 2/3] vfio/display: add xres + yres properties
Message-ID: <20190221103536.2166450b@w520.home>
In-Reply-To: <20190221074643.cb6chu3tu7nkytpo@sirius.home.kraxel.org>
References: <20190220084753.9130-1-kraxel@redhat.com>
 <20190220084753.9130-3-kraxel@redhat.com>
 <20190220153602.57a11e97@w520.home>
 <20190221074643.cb6chu3tu7nkytpo@sirius.home.kraxel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Thu, 21 Feb 2019 17:35:45 +0000 (UTC)
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
Cc: intel-gvt-dev@lists.freedesktop.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVGh1LCAyMSBGZWIgMjAxOSAwODo0Njo0MyArMDEwMApHZXJkIEhvZmZtYW5uIDxrcmF4ZWxA
cmVkaGF0LmNvbT4gd3JvdGU6Cgo+ICAgSGksCj4gCj4gPiA+ICsgICAgREVGSU5FX1BST1BfVUlO
VDMyKCJ4cmVzIiwgVkZJT1BDSURldmljZSwgZGlzcGxheV94cmVzLCAwKSwKPiA+ID4gKyAgICBE
RUZJTkVfUFJPUF9VSU5UMzIoInlyZXMiLCBWRklPUENJRGV2aWNlLCBkaXNwbGF5X3lyZXMsIDAp
LCAgCj4gPiAKPiA+IFRoaXMgaXMgYWN0dWFsbHkgcXVpdGUgZnVuLCBJIHN0YXJ0ZWQgbXkgVk0g
d2l0aCBhcmJpdHJhcnkgbnVtYmVycyBhbmQKPiA+IHRoZSBXaW5kb3dzIEdVSSBob25vcmVkIGl0
IGV2ZXJ5IHRpbWUuICBQcm9iYWJseSB2ZXJ5IHVzZWZ1bCBmb3IKPiA+IHBsYXlpbmcgd2l0aCBv
ZGQgc2NyZWVuIHNpemVzLiAgSSBhbHNvIHRyaWVkIHRvIGJyZWFrIGl0IHVzaW5nCj4gPiAxMDAw
MDAweDEwMDAwMDAsIGJ1dCB0aGUgZGlzcGxheSBjYW1lIHVwIGFzIDE5MjB4MTIwMCwgdGhlIG1h
eGltdW0KPiA+IHJlc29sdXRpb24gR1ZULWcgc3VwcG9ydHMgZm9yIHRoaXMgdHlwZS4gIEkgZG9u
J3Qgc2VlIHRoYXQgUUVNVSBpcwo+ID4gYm91bmRpbmcgdGhpcyB0aG91Z2gsIGRvIHdlIGRlcGVu
ZCBvbiB0aGUgbWRldiBkZXZpY2UgdG8gaWdub3JlIGl0IGlmCj4gPiB3ZSBwYXNzIHZhbHVlcyBp
dCBjYW5ub3Qgc3VwcG9ydD8gIAo+IAo+IFRoZXJlIGlzIGEgY2hlY2sgaW4gdmZpb19kaXNwbGF5
X2VkaWRfdXBkYXRlKCkuCgpPaywgc28gd2UncmUgYm91bmRlZCB3aXRoaW4gUUVNVSwgdGhhdCBz
ZWVtcyBnb29kLiAgVGhhbmtzLAoKQWxleApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
