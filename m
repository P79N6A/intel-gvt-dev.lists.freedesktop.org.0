Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp2275150ywo;
        Tue, 2 Apr 2019 20:27:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy5TLfSxAgakdo4EMEaE/YapTo0Y02SNDDLrYxFMr4l9mkNSCLSI5ZUu4uRbP+1OyPolBFL
X-Received: by 2002:a62:1197:: with SMTP id 23mr72383218pfr.210.1554262071585;
        Tue, 02 Apr 2019 20:27:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554262071; cv=none;
        d=google.com; s=arc-20160816;
        b=hBLV3/rt9c+c/qiu1hoqGpf+lLsQsY65vO5NA4BG4YpasA99Qos9+Zo0zyz9EM6MrB
         UcUsJZ1Ng95nPY52qBvGrRrSZynxEiD49kJx3IWphgHZQO0CMTtyVGy940B4HGc6nl/p
         Zb/41P8stUyJifJMZ/ZArXriIEq719HsKfo/Yxrh54SbXEMQNEMdnWeblq/Gh85BlGST
         kxrfJcUXZq3lW4dsnQjQpBTmDtVOScPcne/AZ0oDRBvFhv1g/mpN2horFblcn2aBCdMV
         J98euVX6Ag95wZZtJ499fE/BRkVPdn9LcKRetTlGRPBsgHPE+dJjyRJg3hFOXgbxnklS
         e8qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:message-id:date:subject:to:from:delivered-to;
        bh=YujQ7vJtpUqcm2QYP0wkJuAU4Q9s4feDV5y6s/tz2yU=;
        b=cNlGoIWWHat1g/ZjUNn0e77tX9fnleGedoDTvqmJKys+ukFIP3cvBwHbhYzsdEJtqD
         LfyC6HMOvf9TsES90p5A2eDJ4j+RJvPGYPCTyWkmypE8NltOiV55ztpuTjaIDaChMngr
         jDV1KnnFZIhsQGZuKnYGtwxx1y7P/czOR7l2SKpWTG5CbHZT5fQoFRvjixAzzEzwYKks
         +ejG9QyTgpxoYaEVtlG75F9tlsss9Su4DFI/z+wzzEUbEijsCl4tot1bmkfcxWpguG9s
         ZwPRZ1oT1MdlqMix7t+XSsniIOCsHqrJD9sBwZZ04QDxC+cRCbiq4cbA6zzvAX775mmT
         fIrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id 59si13266781plb.405.2019.04.02.20.27.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Apr 2019 20:27:51 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A856E4A2;
	Wed,  3 Apr 2019 03:27:50 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 129AD6E4A2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  3 Apr 2019 03:27:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Apr 2019 20:27:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,303,1549958400"; d="scan'208";a="128164365"
Received: from unknown (HELO xzhan34-rh.bj.intel.com) ([10.238.154.52])
 by orsmga007.jf.intel.com with ESMTP; 02 Apr 2019 20:27:48 -0700
From: Xiaolin Zhang <xiaolin.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: addressed guest GPU hang with HWS index mode
Date: Wed,  3 Apr 2019 11:31:17 +0800
Message-Id: <20190403033117.8289-1-xiaolin.zhang@intel.com>
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
aGFuCmFkZHJlc3NlcyIpCgpTaWduZWQtb2ZmLWJ5OiBYaWFvbGluIFpoYW5nIDx4aWFvbGluLnpo
YW5nQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvY21kX3BhcnNlci5j
IHwgMjUgKysrKysrKysrKysrKysrKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDIyIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L2NtZF9wYXJzZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9jbWRfcGFyc2Vy
LmMKaW5kZXggYjQyMDkxOTI3OWM3Li5mOTc2Nzc3ZDdiZDUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC9jbWRfcGFyc2VyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3Z0L2NtZF9wYXJzZXIuYwpAQCAtMTA3MCw2ICsxMDcwLDE4IEBAIHN0YXRpYyBzdHJ1Y3QgY21k
X2ludGVycnVwdF9ldmVudCBjbWRfaW50ZXJydXB0X2V2ZW50c1tdID0gewogCX0sCiB9OwogCitz
dGF0aWMgaW50IGluZGV4X21vZGVfdG9fZ21hKHN0cnVjdCBwYXJzZXJfZXhlY19zdGF0ZSAqcywg
dTMyIGluZGV4KQoreworCXUzMiBnbWE7CisJdTMyIHZhbDsKKworCWdtYSA9IHMtPnZncHUtPmh3
c19wZ2Fbcy0+cmluZ19pZF0gKyBpbmRleDsKKwlwYXRjaF92YWx1ZShzLCBjbWRfcHRyKHMsIDIp
LCBnbWEpOworCXZhbCA9IGNtZF92YWwocywgMSkgJiAoflBJUEVfQ09OVFJPTF9TVE9SRV9EQVRB
X0lOREVYKTsKKwlwYXRjaF92YWx1ZShzLCBjbWRfcHRyKHMsIDEpLCB2YWwpOworCXJldHVybiAw
OworfQorCiBzdGF0aWMgaW50IGNtZF9oYW5kbGVyX3BpcGVfY29udHJvbChzdHJ1Y3QgcGFyc2Vy
X2V4ZWNfc3RhdGUgKnMpCiB7CiAJaW50IGdtYWRyX2J5dGVzID0gcy0+dmdwdS0+Z3Z0LT5kZXZp
Y2VfaW5mby5nbWFkcl9ieXRlc19pbl9jbWQ7CkBAIC0xMDk4LDggKzExMTAsMTEgQEAgc3RhdGlj
IGludCBjbWRfaGFuZGxlcl9waXBlX2NvbnRyb2woc3RydWN0IHBhcnNlcl9leGVjX3N0YXRlICpz
KQogCQkJCS8qIFN0b3JlIERhdGEgSW5kZXggKi8KIAkJCQlpZiAoY21kX3ZhbChzLCAxKSAmICgx
IDw8IDIxKSkKIAkJCQkJaW5kZXhfbW9kZSA9IHRydWU7Ci0JCQkJcmV0IHw9IGNtZF9hZGRyZXNz
X2F1ZGl0KHMsIGdtYSwgc2l6ZW9mKHU2NCksCi0JCQkJCQlpbmRleF9tb2RlKTsKKwkJCQlpZiAo
aW5kZXhfbW9kZSkKKwkJCQkJcmV0ID0gaW5kZXhfbW9kZV90b19nbWEocywgZ21hKTsKKwkJCQll
bHNlCisJCQkJCXJldCB8PSBjbWRfYWRkcmVzc19hdWRpdChzLCBnbWEsCisJCQkJCQlzaXplb2Yo
dTY0KSwgaW5kZXhfbW9kZSk7CiAJCQl9CiAJCX0KIAl9CkBAIC0xNjA3LDcgKzE2MjIsMTEgQEAg
c3RhdGljIGludCBjbWRfaGFuZGxlcl9taV9mbHVzaF9kdyhzdHJ1Y3QgcGFyc2VyX2V4ZWNfc3Rh
dGUgKnMpCiAJCS8qIFN0b3JlIERhdGEgSW5kZXggKi8KIAkJaWYgKGNtZF92YWwocywgMCkgJiAo
MSA8PCAyMSkpCiAJCQlpbmRleF9tb2RlID0gdHJ1ZTsKLQkJcmV0ID0gY21kX2FkZHJlc3NfYXVk
aXQocywgZ21hLCBzaXplb2YodTY0KSwgaW5kZXhfbW9kZSk7CisJCWlmIChpbmRleF9tb2RlKQor
CQkJcmV0ID0gaW5kZXhfbW9kZV90b19nbWEocywgZ21hKTsKKwkJZWxzZQorCQkJcmV0ID0gY21k
X2FkZHJlc3NfYXVkaXQocywgZ21hLAorCQkJCQlzaXplb2YodTY0KSwgaW5kZXhfbW9kZSk7CiAJ
fQogCS8qIENoZWNrIG5vdGlmeSBiaXQgKi8KIAlpZiAoKGNtZF92YWwocywgMCkgJiAoMSA8PCA4
KSkpCi0tIAoyLjE1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaW50ZWwtZ3Z0LWRldg==
