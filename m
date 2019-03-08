Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp7726391ywe;
        Thu, 7 Mar 2019 23:53:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqxHtd+KROYuSFSD6ezPJCDryMZxJhNgwuVF5JgqRHrOZzMcap9ZYyBWyxvAHxfwVvm7Ig4q
X-Received: by 2002:a65:6290:: with SMTP id f16mr15397482pgv.106.1552031591587;
        Thu, 07 Mar 2019 23:53:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552031591; cv=none;
        d=google.com; s=arc-20160816;
        b=yqysXg9j7yHq8Py1zDPnAg5E921irfaUXHH9hkUVrFQ30b3vUIqnQ0k9ggcj9oFySD
         xrFW2AI16Rho17e7K0DhGZSL3Vcuzh/cnRN0kIvGREDGt9u9MnUMViumWR7qHEBggSXj
         f4DfwNSoAAfHns/YpuMHehuf0hTVkLDyE3Qyc9Tfqts1b/JFwBvRGVYdCxnOR93rBe8b
         pOZbi3tInyooCXPIetG5O/cM31ROoOyjpbztY2gnwJLYoKnhPkt+3G3KM3Z+1VFxsW3r
         UPdKhsaqDrqmxK/E+SzR+8p8ujLRgZ+98iAPuHPKKIzb/R0jNvjuDO0EXXTbWnrbSMbW
         fGRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:message-id:date:subject:to:from
         :delivered-to;
        bh=XexMow31gEPoN/UHTHSDWHKsAMWBUUGXuLnuAeHO+gs=;
        b=iTJb7Lp8mfsrevGu2/eUXUoVvxtE1v5NbdoIMU6rTEQgzwb84CDkpjn1Z7UOWPamFe
         /o5PK+5HFRFRx+pq21XkDcXvY+mVnzLL+KoRK/Ac/xGuylv9UG2mYEEVRYr4hOCiTza/
         hAH19rIf1lChttjqdTk4aqZeW/YVMMbpOfOJU3N/5ducjujucEZ0pPMo83G9tM6+6Uzw
         lKg9xH0sg0geUYpzbdBX3njB7ZgWSMWL3hCJVA81oBTZ4qxz8FW0/eOnY6YxF4fxF/Sn
         YhLq5uL9+JDaXbcY51Tj1NqHL+qkUj9i9JBhvP5ulpKJdHTRf/gG72J0/GhHCqERaqQk
         78Yg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id p22si6235771pfd.241.2019.03.07.23.53.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Mar 2019 23:53:11 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B6A6E29A;
	Fri,  8 Mar 2019 07:53:11 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC8906E296;
 Fri,  8 Mar 2019 07:53:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Mar 2019 23:53:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,455,1544515200"; d="scan'208";a="140191910"
Received: from debian-nuc.sh.intel.com ([10.239.160.36])
 by orsmga002.jf.intel.com with ESMTP; 07 Mar 2019 23:53:08 -0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: relax debug BUG_ON() for closed context in hw_id pin
Date: Fri,  8 Mar 2019 15:52:37 +0800
Message-Id: <20190308075238.1778-1-zhenyuw@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: intel-gvt-dev@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Q3VycmVudCBHVlQgY3JlYXRlZCBjb250ZXh0IGlzIG1hcmtlZCBjbG9zZWQgYXMgbm90IHRvIGJl
IHVzZWQgZm9yCmhvc3QgdXNlci4gQnV0IGl0cyBod19pZCBzaG91bGQgc3RpbGwgYmUgdXNlZC4g
U28gdGhpcyBpcyB0byByZWxheApkZWJ1ZyBCVUdfT04oKSBpbiBfX2k5MTVfZ2VtX2NvbnRleHRf
cGluX2h3X2lkKCkgZm9yIEdWVCBjb250ZXh0cwp3aGljaCBjYW4gdXNlIGZvcmNlIHNpbmdsZSBz
dWJtaXNzaW9uIGZsYWcgdG8gaWRlbnRpZnkuCgpDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJp
cy13aWxzb24uY28udWs+ClNpZ25lZC1vZmYtYnk6IFpoZW55dSBXYW5nIDx6aGVueXV3QGxpbnV4
LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2dlbV9jb250ZXh0LmMg
fCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtX2NvbnRleHQuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtX2NvbnRleHQuYwppbmRleCBiOWYzMjE5NDc5ODIu
LjBjYmM1MjkzZGExYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9nZW1f
Y29udGV4dC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtX2NvbnRleHQuYwpA
QCAtMTQwMCw3ICsxNDAwLDggQEAgaW50IF9faTkxNV9nZW1fY29udGV4dF9waW5faHdfaWQoc3Ry
dWN0IGk5MTVfZ2VtX2NvbnRleHQgKmN0eCkKIAogCW11dGV4X2xvY2soJmk5MTUtPmNvbnRleHRz
Lm11dGV4KTsKIAotCUdFTV9CVUdfT04oaTkxNV9nZW1fY29udGV4dF9pc19jbG9zZWQoY3R4KSk7
CisJR0VNX0JVR19PTihpOTE1X2dlbV9jb250ZXh0X2lzX2Nsb3NlZChjdHgpICYmCisJCSAgICFp
OTE1X2dlbV9jb250ZXh0X2ZvcmNlX3NpbmdsZV9zdWJtaXNzaW9uKGN0eCkpOwogCiAJaWYgKGxp
c3RfZW1wdHkoJmN0eC0+aHdfaWRfbGluaykpIHsKIAkJR0VNX0JVR19PTihhdG9taWNfcmVhZCgm
Y3R4LT5od19pZF9waW5fY291bnQpKTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50
ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
