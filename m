Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp2464870ywo;
        Wed, 3 Apr 2019 01:04:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyCsHeCRRSc1z60x7XAVxryMbJblZhSyZlQWnDBfrlHYCJSgLE8pns9KA5k3tt566fuqwhm
X-Received: by 2002:a17:902:ab87:: with SMTP id f7mr11135782plr.85.1554278643132;
        Wed, 03 Apr 2019 01:04:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554278643; cv=none;
        d=google.com; s=arc-20160816;
        b=tbx8cQNRmGxCGwqxPEc2nQX+2e9ySMsrqJ+6DrQzDH6epOL2vTLaJF8g2UcCWI9dzs
         AaAXLT33EfXyfTg7BWiU43kh0QGI6HTlVTC0izEm9QDHVn+PAzl+slzIsjqwWB63AKsL
         uApBnzsY7vLxoifq0ECc8tvfELxfKg2v0+qRoabe6UlZThwZRbLrgRoJGwFzIs+lDWaL
         BtMPlLXB5LG1sn2/guYC9/VlpA2sfmdReb41MrTYwG+n2tsSlnN4Z2z6woK2FCm78njd
         x0pmc5WTOapFftnz9is8Tf0onYWK4ZKtFoTV1SgeIyJ/zsYTwmcTfhOa2UQ1831tDPX6
         Jq3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:message-id:date:subject:to:from:delivered-to;
        bh=irNpXB9wRteCsGPgxnRKLES8a5i5iROY12p5gUsfPT8=;
        b=RYK2nWQiaKC6eCYtfDvVsuRFRZUVomUJtqlZcDSkobcsL3pM0/CbWIMhQJ8SLH0gx7
         3cZDp0zpLiRkBcVA1qCjdzCg2sG34US+422M2YIwyY2Aa239kIC5bM7YZiGcPL3EitIk
         I5Z0KexTtNQYdN3f+dMeX7o+4Yn58P9XCZAvh11YTohSQUxcTQYzHWJ2bx+PpSPbonOH
         JKLwVWbwyQK2vJrB3u7Qn4gY+vHqNvst7z3zS9j5dB9RU3aWf2A4Xw5BBnfNSxPvi3rg
         tku6MUfjUNE8/dLdUdQg/iV/2I2htZoRG9+MF9d7Dn+ocpdON+jRGVid1tqjLhjHauYm
         rzrw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id l69si13521084plb.272.2019.04.03.01.04.02
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Apr 2019 01:04:03 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AC826E96C;
	Wed,  3 Apr 2019 08:04:02 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F316E96C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  3 Apr 2019 08:04:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Apr 2019 01:04:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,304,1549958400"; d="scan'208";a="137166585"
Received: from unknown (HELO xzhan34-rh.bj.intel.com) ([10.238.154.52])
 by fmsmga008.fm.intel.com with ESMTP; 03 Apr 2019 01:03:58 -0700
From: Xiaolin Zhang <xiaolin.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v5] drm/i915/gvt: addressed guest GPU hang with HWS index mode
Date: Wed,  3 Apr 2019 16:07:28 +0800
Message-Id: <20190403080728.8140-1-xiaolin.zhang@intel.com>
X-Mailer: git-send-email 2.15.1
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
Cc: Xiaolin Zhang <xiaolin.zhang@intel.com>, zhenyuw@linux.intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

d2l0aCB0aGUgaW50cm9kdWNlIG9mICJzd2l0Y2ggdG8gdXNlIEhXUyBpbmRpY2VzIHJhdGhlciB0
aGFuIGFkZHJlc3MiLApndWVzdCBHUFUgaGFuZyBvYnNlcnZlZCB3aGVuIHJ1bm5pbmcgd29ya2xv
YWRzIHdoaWNoIHdpbGwgdXBkYXRlIHRoZQpzZXFubyB0byB0aGUgcmVhbCBIVyBIV1NQLCBub3Qg
dml0dXJhbCBHUFUgSFdTUCBhbmQgdGhlbiBjYXVzZSBHUFUgaGFuZy4KCnRoaXMgcGF0Y2ggaXMg
dG8gcmV2b2tlIGluZGV4IG1vZGUgaW4gUElQRV9DVFJMIGFuZCBNSV9GTFVTSF9EVyBhbmQKcGF0
Y2ggZ3Vlc3QgR1BVIEhXU1AgYWRkcmVzcyB2YWx1ZSB0byB0aGVzZSBjb21tYW5kcy4KCkZpeGVz
OiA1NDkzOWVhMGIoImRybS9pOTE1OiBTd2l0Y2ggdG8gdXNlIEhXUyBpbmRpY2VzIHJhdGhlciB0
aGFuCmFkZHJlc3NlcyIpCgp2NTogcmVmaW5lIGNvZGUgbG9naWMgdG8gaGFuZGxlIGluZGV4X21v
ZGUuCnY0OiBjYWxsIGNtZF9hZGRyZXNzX2F1ZGl0IGZvciBuZXcgYWRkcmVzcyBjb252ZXJ0ZWQg
ZnJvbSBpbmRleC4KdjM6IGhhbmRsZSBpbmRleCBtb2RlIHRvIGdtYSBjb252ZXJzaW9uIHdpdGhp
biBjbWQgaGFuZGxlciBpdHNlbGYuCnYyOiBQSVBFX0NUUkwgYW5kIE1JX0ZMVVNIX0RXIGhhcyBk
aWZmZXJlbnQgYWRkcmVzcyBvZmZzZXQsIG9mZnNldCBpcwphbHNvIHBhc3NlZCBmb3IgZ21hIGFk
ZHJlc3MgdXBkYXRlLiA8emhlbnl1PgoKU2lnbmVkLW9mZi1ieTogWGlhb2xpbiBaaGFuZyA8eGlh
b2xpbi56aGFuZ0BpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9w
YXJzZXIuYyB8IDIyICsrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyMiBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9w
YXJzZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9jbWRfcGFyc2VyLmMKaW5kZXggYjQy
MDkxOTI3OWM3Li4wODNiYTY0YzhmNWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC9jbWRfcGFyc2VyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJz
ZXIuYwpAQCAtMTA3Nyw2ICsxMDc3LDggQEAgc3RhdGljIGludCBjbWRfaGFuZGxlcl9waXBlX2Nv
bnRyb2woc3RydWN0IHBhcnNlcl9leGVjX3N0YXRlICpzKQogCWJvb2wgaW5kZXhfbW9kZSA9IGZh
bHNlOwogCXVuc2lnbmVkIGludCBwb3N0X3N5bmM7CiAJaW50IHJldCA9IDA7CisJdTMyIGh3c19n
cGE7CisJdTMyIHZhbDsKIAogCXBvc3Rfc3luYyA9IChjbWRfdmFsKHMsIDEpICYgUElQRV9DT05U
Uk9MX1BPU1RfU1lOQ19PUF9NQVNLKSA+PiAxNDsKIApAQCAtMTEwMCw2ICsxMTAyLDE1IEBAIHN0
YXRpYyBpbnQgY21kX2hhbmRsZXJfcGlwZV9jb250cm9sKHN0cnVjdCBwYXJzZXJfZXhlY19zdGF0
ZSAqcykKIAkJCQkJaW5kZXhfbW9kZSA9IHRydWU7CiAJCQkJcmV0IHw9IGNtZF9hZGRyZXNzX2F1
ZGl0KHMsIGdtYSwgc2l6ZW9mKHU2NCksCiAJCQkJCQlpbmRleF9tb2RlKTsKKwkJCQlpZiAocmV0
KQorCQkJCQlyZXR1cm4gcmV0OworCQkJCWlmIChpbmRleF9tb2RlKSB7CisJCQkJCWh3c19ncGEg
PSBzLT52Z3B1LT5od3NfcGdhW3MtPnJpbmdfaWRdOworCQkJCQlnbWEgPSBod3NfZ3BhICsgZ21h
OworCQkJCQlwYXRjaF92YWx1ZShzLCBjbWRfcHRyKHMsIDIpLCBnbWEpOworCQkJCQl2YWwgPSBj
bWRfdmFsKHMsIDEpICYgKH4oMSA8PCAyMSkpOworCQkJCQlwYXRjaF92YWx1ZShzLCBjbWRfcHRy
KHMsIDEpLCB2YWwpOworCQkJCX0KIAkJCX0KIAkJfQogCX0KQEAgLTE1OTgsNiArMTYwOSw4IEBA
IHN0YXRpYyBpbnQgY21kX2hhbmRsZXJfbWlfZmx1c2hfZHcoc3RydWN0IHBhcnNlcl9leGVjX3N0
YXRlICpzKQogCXVuc2lnbmVkIGxvbmcgZ21hOwogCWJvb2wgaW5kZXhfbW9kZSA9IGZhbHNlOwog
CWludCByZXQgPSAwOworCXUzMiBod3NfZ3BhOworCXUzMiB2YWw7CiAKIAkvKiBDaGVjayBwb3N0
LXN5bmMgYW5kIHBwZ3R0IGJpdCAqLwogCWlmICgoKGNtZF92YWwocywgMCkgPj4gMTQpICYgMHgz
KSAmJiAoY21kX3ZhbChzLCAxKSAmICgxIDw8IDIpKSkgewpAQCAtMTYwOCw2ICsxNjIxLDE1IEBA
IHN0YXRpYyBpbnQgY21kX2hhbmRsZXJfbWlfZmx1c2hfZHcoc3RydWN0IHBhcnNlcl9leGVjX3N0
YXRlICpzKQogCQlpZiAoY21kX3ZhbChzLCAwKSAmICgxIDw8IDIxKSkKIAkJCWluZGV4X21vZGUg
PSB0cnVlOwogCQlyZXQgPSBjbWRfYWRkcmVzc19hdWRpdChzLCBnbWEsIHNpemVvZih1NjQpLCBp
bmRleF9tb2RlKTsKKwkJaWYgKHJldCkKKwkJCXJldHVybiByZXQ7CisJCWlmIChpbmRleF9tb2Rl
KSB7CisJCQlod3NfZ3BhID0gcy0+dmdwdS0+aHdzX3BnYVtzLT5yaW5nX2lkXTsKKwkJCWdtYSA9
IGh3c19ncGEgKyBnbWE7CisJCQlwYXRjaF92YWx1ZShzLCBjbWRfcHRyKHMsIDEpLCBnbWEpOwor
CQkJdmFsID0gY21kX3ZhbChzLCAwKSAmICh+KDEgPDwgMjEpKTsKKwkJCXBhdGNoX3ZhbHVlKHMs
IGNtZF9wdHIocywgMCksIHZhbCk7CisJCX0KIAl9CiAJLyogQ2hlY2sgbm90aWZ5IGJpdCAqLwog
CWlmICgoY21kX3ZhbChzLCAwKSAmICgxIDw8IDgpKSkKLS0gCjIuMTUuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5n
IGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
