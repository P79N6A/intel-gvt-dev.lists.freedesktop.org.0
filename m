Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp2884783ywd;
        Mon, 14 Jan 2019 02:50:57 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4KiQpcJeaNXmAaEI5eya7lqUu9oPVaGrhgdBcL7rs1ikfg+IQ8lNpbPoR43RlLiIgzeyda
X-Received: by 2002:a62:2082:: with SMTP id m2mr24220530pfj.163.1547463057785;
        Mon, 14 Jan 2019 02:50:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547463057; cv=none;
        d=google.com; s=arc-20160816;
        b=MIKzL3OmsB4MLZh7dNyo2jHqnU64k23D9gjpTiX1YY45XqqFjaGYzw95Ec6u6uIjgJ
         uEA+kmIpmweUayNsZAwb3lsoATzam53vfC6cv6ldZFy/yRyjbHDDij9JgdhlwnFB+fKT
         lXMjXg/K4JE4fesqifZNFHmsTbteLGO7ia4esJOjJz5qa4qfCvKBFue0PQDeuhAKQaKY
         sfXk+2DQpJz9cpjolBpj5hlzlmWhyihTiPwSGbZuC6IDVsPRr00PGdGDTlslz/XG1cvB
         aA6M7+SeKG6Am5/FF4O09ZrFSItRzfNfGQUeVOxCf8ZkX08wsNGaDTotklN+WX4TpItX
         /FBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:message-id:date:subject:to:from:delivered-to;
        bh=azYwwv2nGgHAIvdkzIuYtfqEcQNOzuGGuTk/QkxCHR8=;
        b=QrFJgOReK864zMsUGLXQfgdS8RoyMeF0zIHufLtl8fyYABF90EZ8TlDAo4EXH5V8DR
         1VhHFQK1zoNs2mvDRqm82FDi3CwGMWPBC14jVLC4/WPEMk7M+v4dL2kbNNgxmfbelnQS
         qUcm1x18Qfhq4eSFRYDmtAJwX3tIcqmUjhrqzUkEIxqbIAc4LB9n/Z8yZHkKjrsTBRpG
         xmFprvdjX2Xk0km1e4FF7YIxpHdm8wHnuz6yCxcCmWtDYWfcuf0nVHE8PApaCjgm2aFt
         3HUgQKdmC+8nQpvz0bBlXFTkFGked7FoP4+qmUtNwNtDiMI/EaBWmBMZQF2PiHXS7ni8
         VPkw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id o28si66254pgm.238.2019.01.14.02.50.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jan 2019 02:50:57 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1445894E7;
	Mon, 14 Jan 2019 10:50:56 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 600D8894E7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 14 Jan 2019 10:50:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jan 2019 02:50:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,477,1539673200"; d="scan'208";a="135624328"
Received: from henry-optiplex-7050.bj.intel.com ([10.238.157.81])
 by fmsmga004.fm.intel.com with ESMTP; 14 Jan 2019 02:50:53 -0800
From: hang.yuan@linux.intel.com
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: free VFIO region space in vgpu detach
Date: Mon, 14 Jan 2019 18:43:39 +0800
Message-Id: <1547462619-15700-1-git-send-email-hang.yuan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
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
Cc: Hang Yuan <hang.yuan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

RnJvbTogSGFuZyBZdWFuIDxoYW5nLnl1YW5AbGludXguaW50ZWwuY29tPgoKVkZJTyByZWdpb24g
c3BhY2UgaXMgYWxsb2NhdGVkIHdoZW4gb25lIHJlZ2lvbiBpcyByZWdpc3RlcmVkIGZvcgpvbmUg
dmdwdS4gU28gZnJlZSB0aGUgc3BhY2Ugd2hlbiBkZXN0cm95IHRoZSB2Z3B1LgoKQWxzbyBjaGFu
Z2UgdGhlIHBhcmFtZXRlciBvZiBkZXRhY2hfdmdwdSBjYWxsYmFjayB0byB1c2UgdmdwdSBkaXJl
Y3RseS4KCkZpeGVzOiBiODUxYWRlYWMwODU4YzdkMjU3YjMgKCJkcm0vaTkxNS9ndnQ6IEFkZCBv
cHJlZ2lvbiBzdXBwb3J0IikKU2lnbmVkLW9mZi1ieTogSGFuZyBZdWFuIDxoYW5nLnl1YW5AbGlu
dXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oeXBlcmNhbGwuaCB8
ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQva3ZtZ3QuYyAgICAgfCAxNiArKysrKysr
KysrKysrKy0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvbXB0LmggICAgICAgfCAgMiArLQog
MyBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oeXBlcmNhbGwuaCBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d2dC9oeXBlcmNhbGwuaAppbmRleCA1MDc5ODg2Li44MzFhYjM0IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaHlwZXJjYWxsLmgKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Z0L2h5cGVyY2FsbC5oCkBAIC00Nyw3ICs0Nyw3IEBAIHN0cnVjdCBpbnRl
bF9ndnRfbXB0IHsKIAlpbnQgKCpob3N0X2luaXQpKHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCAq
Z3Z0LCBjb25zdCB2b2lkICpvcHMpOwogCXZvaWQgKCpob3N0X2V4aXQpKHN0cnVjdCBkZXZpY2Ug
KmRldik7CiAJaW50ICgqYXR0YWNoX3ZncHUpKHZvaWQgKnZncHUsIHVuc2lnbmVkIGxvbmcgKmhh
bmRsZSk7Ci0Jdm9pZCAoKmRldGFjaF92Z3B1KSh1bnNpZ25lZCBsb25nIGhhbmRsZSk7CisJdm9p
ZCAoKmRldGFjaF92Z3B1KSh2b2lkICp2Z3B1KTsKIAlpbnQgKCppbmplY3RfbXNpKSh1bnNpZ25l
ZCBsb25nIGhhbmRsZSwgdTMyIGFkZHIsIHUxNiBkYXRhKTsKIAl1bnNpZ25lZCBsb25nICgqZnJv
bV92aXJ0X3RvX21mbikodm9pZCAqcCk7CiAJaW50ICgqZW5hYmxlX3BhZ2VfdHJhY2spKHVuc2ln
bmVkIGxvbmcgaGFuZGxlLCB1NjQgZ2ZuKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2d2dC9rdm1ndC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2t2bWd0LmMKaW5kZXgg
YTE5ZTY4NC4uYjZiYjY1MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2t2
bWd0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2t2bWd0LmMKQEAgLTE2NzEsOSAr
MTY3MSwyMSBAQCBzdGF0aWMgaW50IGt2bWd0X2F0dGFjaF92Z3B1KHZvaWQgKnZncHUsIHVuc2ln
bmVkIGxvbmcgKmhhbmRsZSkKIAlyZXR1cm4gMDsKIH0KIAotc3RhdGljIHZvaWQga3ZtZ3RfZGV0
YWNoX3ZncHUodW5zaWduZWQgbG9uZyBoYW5kbGUpCitzdGF0aWMgdm9pZCBrdm1ndF9kZXRhY2hf
dmdwdSh2b2lkICpwX3ZncHUpCiB7Ci0JLyogbm90aGluZyB0byBkbyBoZXJlICovCisJaW50IGk7
CisJc3RydWN0IGludGVsX3ZncHUgKnZncHUgPSAoc3RydWN0IGludGVsX3ZncHUgKilwX3ZncHU7
CisKKwlpZiAoIXZncHUtPnZkZXYucmVnaW9uKQorCQlyZXR1cm47CisKKwlmb3IgKGkgPSAwOyBp
IDwgdmdwdS0+dmRldi5udW1fcmVnaW9uczsgaSsrKQorCQlpZiAodmdwdS0+dmRldi5yZWdpb25b
aV0ub3BzLT5yZWxlYXNlKQorCQkJdmdwdS0+dmRldi5yZWdpb25baV0ub3BzLT5yZWxlYXNlKHZn
cHUsCisJCQkJCSZ2Z3B1LT52ZGV2LnJlZ2lvbltpXSk7CisJdmdwdS0+dmRldi5udW1fcmVnaW9u
cyA9IDA7CisJa2ZyZWUodmdwdS0+dmRldi5yZWdpb24pOworCXZncHUtPnZkZXYucmVnaW9uID0g
TlVMTDsKIH0KIAogc3RhdGljIGludCBrdm1ndF9pbmplY3RfbXNpKHVuc2lnbmVkIGxvbmcgaGFu
ZGxlLCB1MzIgYWRkciwgdTE2IGRhdGEpCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndnQvbXB0LmggYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvbXB0LmgKaW5kZXggOWI0MjI1
ZC4uNWI1OTk1YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21wdC5oCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9tcHQuaApAQCAtOTksNyArOTksNyBAQCBzdGF0
aWMgaW5saW5lIHZvaWQgaW50ZWxfZ3Z0X2h5cGVydmlzb3JfZGV0YWNoX3ZncHUoc3RydWN0IGlu
dGVsX3ZncHUgKnZncHUpCiAJaWYgKCFpbnRlbF9ndnRfaG9zdC5tcHQtPmRldGFjaF92Z3B1KQog
CQlyZXR1cm47CiAKLQlpbnRlbF9ndnRfaG9zdC5tcHQtPmRldGFjaF92Z3B1KHZncHUtPmhhbmRs
ZSk7CisJaW50ZWxfZ3Z0X2hvc3QubXB0LT5kZXRhY2hfdmdwdSh2Z3B1KTsKIH0KIAogI2RlZmlu
ZSBNU0lfQ0FQX0NPTlRST0wob2Zmc2V0KSAob2Zmc2V0ICsgMikKLS0gCjIuNy40CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1h
aWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXYK
