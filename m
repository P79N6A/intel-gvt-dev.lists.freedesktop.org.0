Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp332125ywe;
        Thu, 28 Feb 2019 01:56:01 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYb312MRyqcxVeKTjGtEu0LXYZpl4wUFlb+kzVro5VurcEq+Q+TwL1W09k4w9OBBj/YuIcg
X-Received: by 2002:a17:902:8e8b:: with SMTP id bg11mr6286525plb.328.1551347761113;
        Thu, 28 Feb 2019 01:56:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551347761; cv=none;
        d=google.com; s=arc-20160816;
        b=YhiDivEMRs+pkpm47q+vCmEZMG/eIm3X3pWvj3bQ+seOFM9gsI7QA/Ie8h3h0YiUYi
         H4bI2a5EyufRv7L74hymr935B4nWsVJ4TCJpHx3TivBYjeOvY1dQhlOCpHJZRBgWFWNx
         Mnp448ZaRAU4vn0LK+kCAIRT15Ccsh83rqa8u8KUYlKYPhcxo+0j+GTBE5siGD1wd+VO
         8T8a2u9/8OYbDvhy7aXmScW9YEB0gkQgLwHieq72CHBN7Mo0j7aDe/24PqcAbVT74Nfj
         /UW7YAnXqcY6BylqbCicijas7BPoSdCTaHQRBuHAucMHbBt66s+EBCrv8E/aiZd6WbVz
         tB2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence
         :mime-version:message-id:date:subject:to:from:delivered-to;
        bh=LBSCLj7Ri1XGeRaGyGBxqLcxpYTFFtnygx7mQsgJuEE=;
        b=dCyxGJJ3qyfxA0B9zi/LGjMdAwjbEH2bj7HXaGp7wkqDgXgEogdAeNDxlgzWv7aNYK
         5MHzjCpcR5oRPbw5pJebFxHRPLZigeQiKwPvJUAq+9Eraa+WN4KrLnIH6+YmhdHGW8EQ
         p94hE6p442S+gHpNrSjhGhjI7HzadjGnLscALw82t/CbrDWkHuIDqLH9fcBKhdLRheKr
         F+UpD2VbYaRW4z6jVmKlr0swX00xYM12cfjFy8W+7wJjIwrMzDdYtCNfYs4TnnO+F32r
         C7+wywI/J7LpHu12/F2TvB3N06gomr3Sx6hBKpdyaTmBV58khrayqmgpgS0Np3ry2t+q
         Bi7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id b13si16068245pgt.374.2019.02.28.01.56.00
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Feb 2019 01:56:01 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5096A6E166;
	Thu, 28 Feb 2019 09:56:00 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F3306E15E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 28 Feb 2019 09:55:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Feb 2019 01:55:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,423,1544515200"; d="scan'208";a="130033682"
Received: from debian-nuc.sh.intel.com ([10.239.160.36])
 by orsmga003.jf.intel.com with ESMTP; 28 Feb 2019 01:55:58 -0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 1/3] drm/i915/gvt: Don't submit request for error workload
 dispatch
Date: Thu, 28 Feb 2019 17:55:40 +0800
Message-Id: <20190228095542.23356-1-zhenyuw@linux.intel.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

QXMgdkdQVSBzaGFkb3cgY3R4IGlzIGxvYWRlZCB3aXRoIGd1ZXN0IGNvbnRleHQgc3RhdGUsIGFy
Yml0cmFyaWx5CnN1Ym1pdHRpbmcgcmVxdWVzdCBpbiBlcnJvciB3b3JrbG9hZCBkaXNwYXRjaCBw
YXRoIHdvdWxkIGNhdXNlIHRyb3VibGUuClNvIGRvbid0IHRyeSB0byBzdWJtaXQgaW4gZXJyb3Ig
cGF0aCBub3cgbGlrZSBpbiBwcmV2aW91cyBjb2RlLgpUaGlzIGlzIHRvIGZpeCBWTSBmYWlsdXJl
IHdoZW4gR1BVIGhhbmcgaGFwcGVucy4KCkZpeGVzOiBmMGU5OTQzNzI1MTggKCJkcm0vaTkxNS9n
dnQ6IEZpeCB3b3JrbG9hZCByZXF1ZXN0IGFsbG9jYXRpb24gYmVmb3JlIHJlcXVlc3QgYWRkIikK
U2lnbmVkLW9mZi1ieTogWmhlbnl1IFdhbmcgPHpoZW55dXdAbGludXguaW50ZWwuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9zY2hlZHVsZXIuYyB8IDggKysrKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndnQvc2NoZWR1bGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVy
LmMKaW5kZXggMWJiOGY5MzZmZGFhLi41YjU5Y2JhOWY5M2EgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC9zY2hlZHVsZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQvc2NoZWR1bGVyLmMKQEAgLTY3OCw2ICs2NzgsNyBAQCBzdGF0aWMgaW50IGRpc3BhdGNoX3dv
cmtsb2FkKHN0cnVjdCBpbnRlbF92Z3B1X3dvcmtsb2FkICp3b3JrbG9hZCkKIHsKIAlzdHJ1Y3Qg
aW50ZWxfdmdwdSAqdmdwdSA9IHdvcmtsb2FkLT52Z3B1OwogCXN0cnVjdCBkcm1faTkxNV9wcml2
YXRlICpkZXZfcHJpdiA9IHZncHUtPmd2dC0+ZGV2X3ByaXY7CisJc3RydWN0IGk5MTVfcmVxdWVz
dCAqcnE7CiAJaW50IHJpbmdfaWQgPSB3b3JrbG9hZC0+cmluZ19pZDsKIAlpbnQgcmV0OwogCkBA
IC03MDMsNiArNzA0LDEzIEBAIHN0YXRpYyBpbnQgZGlzcGF0Y2hfd29ya2xvYWQoc3RydWN0IGlu
dGVsX3ZncHVfd29ya2xvYWQgKndvcmtsb2FkKQogCiAJcmV0ID0gcHJlcGFyZV93b3JrbG9hZCh3
b3JrbG9hZCk7CiBvdXQ6CisJaWYgKHJldCkgeworCQkvKiBXZSBtaWdodCBzdGlsbCBuZWVkIHRv
IGFkZCByZXF1ZXN0IHdpdGgKKwkJICogY2xlYW4gY3R4IHRvIHJldGlyZSBpdCBwcm9wZXJseS4u
ICovCisJCXJxID0gZmV0Y2hfYW5kX3plcm8oJndvcmtsb2FkLT5yZXEpOworCQlpOTE1X3JlcXVl
c3RfcHV0KHJxKTsKKwl9CisKIAlpZiAoIUlTX0VSUl9PUl9OVUxMKHdvcmtsb2FkLT5yZXEpKSB7
CiAJCWd2dF9kYmdfc2NoZWQoInJpbmcgaWQgJWQgc3VibWl0IHdvcmtsb2FkIHRvIGk5MTUgJXBc
biIsCiAJCQkJcmluZ19pZCwgd29ya2xvYWQtPnJlcSk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGlu
ZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
