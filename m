Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp3033579ywa;
        Mon, 18 Feb 2019 23:51:13 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbpWsR5lH6beSTtoEHwIZEHaRfNE9a2MH5wTO2h+8vqCF5FlMKyfFabkwrkah6iPuJaM4wQ
X-Received: by 2002:a63:1824:: with SMTP id y36mr26818675pgl.68.1550562673297;
        Mon, 18 Feb 2019 23:51:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550562673; cv=none;
        d=google.com; s=arc-20160816;
        b=SoHvSxnj7/e4B7CN/UBZbE/TUNqrbitx8rzyMfbt3jQFw/mBlseCG3fzdoCYRQhs/U
         cVA9WVdiqhw6S+lwflWZzm0r64hlX0NBp1H9Ei4tXrLgl3Bd+H1fl1SQDfPnBWshCcMd
         Sujd8NGbvKSg6WQ9wI3AUuZ+u5126pmraEjSH8WVheUqOLrsbs1aXSG7FHLZs4wq3bZm
         hkJC1Mxi+9vdAmLtvPKiO1yf/OqPTCjY59il1umP1bABSaVv3VaUSDU3lOBuetHqu7K3
         MobF3TscGm5W7iCMYXY1n/YqcT5xK9bNuLAHoUuLFEyzMkIz3rSsyVaSminlHLG1Ek94
         WnJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=8r2hs/c5uj92aI6aKhBSYGwH7ADCuWg71iJjuovi83s=;
        b=yqwN5AGP2CWWF11z0NAwFRjeZXOPolgFp6RKnL4ZhrrpDJyCMRHd+/sIPgCqnJk7Fh
         zR4+DzAJtJHqe1HonnL0MBmi0KXVLfHL1clZrdwNQfVd/h2iw/Dy8i9kqSu0oWi/Fa9k
         tI9cxk6WGPwZqg6a0F2JTam4aFKia4LKEWV/2MwU3fcg9F7NbnHRceTla6in8QZOzSSJ
         CTeKjBVhTSBkl4AN8zgABGvwWwuvtWMeQZmCgdNTD+N6CQLKu3mEnkVMAu0SRKaBgGEm
         4iWcJMb+lJVZAgFwZKhQugniioc0n73zQPOMke/MRfjPG93894MCDAQmUOOkplLZC3dz
         Ketw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id y15si15046227pgf.321.2019.02.18.23.51.13
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Feb 2019 23:51:13 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E393E89248;
	Tue, 19 Feb 2019 07:51:12 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9733F89248
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 19 Feb 2019 07:51:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Feb 2019 23:51:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,387,1544515200"; d="scan'208";a="147958309"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.9])
 by fmsmga001.fm.intel.com with ESMTP; 18 Feb 2019 23:51:09 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	alex.williamson@redhat.com
Subject: [PATCH 3/8] drm/i915/gvt: Patch the gma in gpu commands during
 command parser
Date: Tue, 19 Feb 2019 02:45:53 -0500
Message-Id: <20190219074553.14170-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190219074242.14015-1-yan.y.zhao@intel.com>
References: <20190219074242.14015-1-yan.y.zhao@intel.com>
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
Cc: Yulei Zhang <yulei.zhang@intel.com>, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

RnJvbTogWXVsZWkgWmhhbmcgPHl1bGVpLnpoYW5nQGludGVsLmNvbT4KCkFkanVzdCB0aGUgZ3Jh
cGhpY3MgbWVtb3J5IGFkZHJlc3MgaW4gZ3B1IGNvbW1hbmRzIGFjY29yZGluZyB0bwp0aGUgc2hp
ZnQgb2Zmc2V0IGluIGd1ZXN0cycgYXBlcnR1cmUgYW5kIGhpZGRlbiBnbSBhZGRyZXNzLCBhbmQg
cGF0Y2gKdGhlIGNvbW1hbmRzIGJlZm9yZSBzdWJtaXQgdG8gZXhlY3V0ZS4KClNpZ25lZC1vZmYt
Ynk6IFl1bGVpIFpoYW5nIDx5dWxlaS56aGFuZ0BpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIuYyB8IDMxICsrKysrKysrKysrKysrKysrKysrLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIuYyBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC9jbWRfcGFyc2VyLmMKaW5kZXggNzdhZTYzNGViMTFjLi45MDgzNjc1
NmIyMzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9jbWRfcGFyc2VyLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIuYwpAQCAtOTg0LDcgKzk4
NCw4IEBAIHN0YXRpYyBpbnQgY21kX2hhbmRsZXJfbHJyKHN0cnVjdCBwYXJzZXJfZXhlY19zdGF0
ZSAqcykKIH0KIAogc3RhdGljIGlubGluZSBpbnQgY21kX2FkZHJlc3NfYXVkaXQoc3RydWN0IHBh
cnNlcl9leGVjX3N0YXRlICpzLAotCQl1bnNpZ25lZCBsb25nIGd1ZXN0X2dtYSwgaW50IG9wX3Np
emUsIGJvb2wgaW5kZXhfbW9kZSk7CisJCQkJICAgIHVuc2lnbmVkIGxvbmcgZ3Vlc3RfZ21hLCBp
bnQgb3Bfc2l6ZSwKKwkJCQkgICAgYm9vbCBpbmRleF9tb2RlLCBpbnQgb2Zmc2V0KTsKIAogc3Rh
dGljIGludCBjbWRfaGFuZGxlcl9scm0oc3RydWN0IHBhcnNlcl9leGVjX3N0YXRlICpzKQogewpA
QCAtMTAwNiw3ICsxMDA3LDggQEAgc3RhdGljIGludCBjbWRfaGFuZGxlcl9scm0oc3RydWN0IHBh
cnNlcl9leGVjX3N0YXRlICpzKQogCQkJZ21hID0gY21kX2dtYShzLCBpICsgMSk7CiAJCQlpZiAo
Z21hZHJfYnl0ZXMgPT0gOCkKIAkJCQlnbWEgfD0gKGNtZF9nbWFfaGkocywgaSArIDIpKSA8PCAz
MjsKLQkJCXJldCB8PSBjbWRfYWRkcmVzc19hdWRpdChzLCBnbWEsIHNpemVvZih1MzIpLCBmYWxz
ZSk7CisJCQlyZXQgfD0gY21kX2FkZHJlc3NfYXVkaXQocywgZ21hLCBzaXplb2YodTMyKSwKKwkJ
CQkJCSBmYWxzZSwgaSArIDEpOwogCQkJaWYgKHJldCkKIAkJCQlicmVhazsKIAkJfQpAQCAtMTAz
MCw3ICsxMDMyLDggQEAgc3RhdGljIGludCBjbWRfaGFuZGxlcl9zcm0oc3RydWN0IHBhcnNlcl9l
eGVjX3N0YXRlICpzKQogCQkJZ21hID0gY21kX2dtYShzLCBpICsgMSk7CiAJCQlpZiAoZ21hZHJf
Ynl0ZXMgPT0gOCkKIAkJCQlnbWEgfD0gKGNtZF9nbWFfaGkocywgaSArIDIpKSA8PCAzMjsKLQkJ
CXJldCB8PSBjbWRfYWRkcmVzc19hdWRpdChzLCBnbWEsIHNpemVvZih1MzIpLCBmYWxzZSk7CisJ
CQlyZXQgfD0gY21kX2FkZHJlc3NfYXVkaXQocywgZ21hLCBzaXplb2YodTMyKSwKKwkJCQkJCSBm
YWxzZSwgaSArIDEpOwogCQkJaWYgKHJldCkKIAkJCQlicmVhazsKIAkJfQpAQCAtMTEwMiw3ICsx
MTA1LDcgQEAgc3RhdGljIGludCBjbWRfaGFuZGxlcl9waXBlX2NvbnRyb2woc3RydWN0IHBhcnNl
cl9leGVjX3N0YXRlICpzKQogCQkJCWlmIChjbWRfdmFsKHMsIDEpICYgKDEgPDwgMjEpKQogCQkJ
CQlpbmRleF9tb2RlID0gdHJ1ZTsKIAkJCQlyZXQgfD0gY21kX2FkZHJlc3NfYXVkaXQocywgZ21h
LCBzaXplb2YodTY0KSwKLQkJCQkJCWluZGV4X21vZGUpOworCQkJCQkJaW5kZXhfbW9kZSwgMik7
CiAJCQl9CiAJCX0KIAl9CkBAIC0xNDMyLDEwICsxNDM1LDEzIEBAIHN0YXRpYyB1bnNpZ25lZCBs
b25nIGdldF9nbWFfYmJfZnJvbV9jbWQoc3RydWN0IHBhcnNlcl9leGVjX3N0YXRlICpzLCBpbnQg
aW5kZXgpCiB9CiAKIHN0YXRpYyBpbmxpbmUgaW50IGNtZF9hZGRyZXNzX2F1ZGl0KHN0cnVjdCBw
YXJzZXJfZXhlY19zdGF0ZSAqcywKLQkJdW5zaWduZWQgbG9uZyBndWVzdF9nbWEsIGludCBvcF9z
aXplLCBib29sIGluZGV4X21vZGUpCisJCQkJICAgIHVuc2lnbmVkIGxvbmcgZ3Vlc3RfZ21hLCBp
bnQgb3Bfc2l6ZSwKKwkJCQkgICAgYm9vbCBpbmRleF9tb2RlLCBpbnQgb2Zmc2V0KQogewogCXN0
cnVjdCBpbnRlbF92Z3B1ICp2Z3B1ID0gcy0+dmdwdTsKIAl1MzIgbWF4X3N1cmZhY2Vfc2l6ZSA9
IHZncHUtPmd2dC0+ZGV2aWNlX2luZm8ubWF4X3N1cmZhY2Vfc2l6ZTsKKwlpbnQgZ21hZHJfYnl0
ZXMgPSB2Z3B1LT5ndnQtPmRldmljZV9pbmZvLmdtYWRyX2J5dGVzX2luX2NtZDsKKwl1NjQgaG9z
dF9nbWE7CiAJaW50IGk7CiAJaW50IHJldDsKIApAQCAtMTQ1Myw2ICsxNDU5LDE0IEBAIHN0YXRp
YyBpbmxpbmUgaW50IGNtZF9hZGRyZXNzX2F1ZGl0KHN0cnVjdCBwYXJzZXJfZXhlY19zdGF0ZSAq
cywKIAl9IGVsc2UgaWYgKCFpbnRlbF9ndnRfZ2d0dF92YWxpZGF0ZV9yYW5nZSh2Z3B1LCBndWVz
dF9nbWEsIG9wX3NpemUpKSB7CiAJCXJldCA9IC1FRkFVTFQ7CiAJCWdvdG8gZXJyOworCX0gZWxz
ZQorCQlpbnRlbF9ndnRfZ2d0dF9nbWFkcl9nMmgodmdwdSwgZ3Vlc3RfZ21hLCAmaG9zdF9nbWEp
OworCisJaWYgKG9mZnNldCA+IDApIHsKKwkJcGF0Y2hfdmFsdWUocywgY21kX3B0cihzLCBvZmZz
ZXQpLCBob3N0X2dtYSAmIEdFTk1BU0soMzEsIDIpKTsKKwkJaWYgKGdtYWRyX2J5dGVzID09IDgp
CisJCQlwYXRjaF92YWx1ZShzLCBjbWRfcHRyKHMsIG9mZnNldCArIDEpLAorCQkJCShob3N0X2dt
YSA+PiAzMikgJiBHRU5NQVNLKDE1LCAwKSk7CiAJfQogCiAJcmV0dXJuIDA7CkBAIC0xNDk3LDcg
KzE1MTEsNyBAQCBzdGF0aWMgaW50IGNtZF9oYW5kbGVyX21pX3N0b3JlX2RhdGFfaW1tKHN0cnVj
dCBwYXJzZXJfZXhlY19zdGF0ZSAqcykKIAkJZ21hID0gKGdtYV9oaWdoIDw8IDMyKSB8IGdtYV9s
b3c7CiAJCWNvcmVfaWQgPSAoY21kX3ZhbChzLCAxKSAmICgxIDw8IDApKSA/IDEgOiAwOwogCX0K
LQlyZXQgPSBjbWRfYWRkcmVzc19hdWRpdChzLCBnbWEgKyBvcF9zaXplICogY29yZV9pZCwgb3Bf
c2l6ZSwgZmFsc2UpOworCXJldCA9IGNtZF9hZGRyZXNzX2F1ZGl0KHMsIGdtYSArIG9wX3NpemUg
KiBjb3JlX2lkLCBvcF9zaXplLCBmYWxzZSwgMSk7CiAJcmV0dXJuIHJldDsKIH0KIApAQCAtMTU0
MSw3ICsxNTU1LDcgQEAgc3RhdGljIGludCBjbWRfaGFuZGxlcl9taV9vcF8yZihzdHJ1Y3QgcGFy
c2VyX2V4ZWNfc3RhdGUgKnMpCiAJCWdtYV9oaWdoID0gY21kX3ZhbChzLCAyKSAmIEdFTk1BU0so
MTUsIDApOwogCQlnbWEgPSAoZ21hX2hpZ2ggPDwgMzIpIHwgZ21hOwogCX0KLQlyZXQgPSBjbWRf
YWRkcmVzc19hdWRpdChzLCBnbWEsIG9wX3NpemUsIGZhbHNlKTsKKwlyZXQgPSBjbWRfYWRkcmVz
c19hdWRpdChzLCBnbWEsIG9wX3NpemUsIGZhbHNlLCAxKTsKIAlyZXR1cm4gcmV0OwogfQogCkBA
IC0xNTgxLDcgKzE1OTUsOCBAQCBzdGF0aWMgaW50IGNtZF9oYW5kbGVyX21pX2ZsdXNoX2R3KHN0
cnVjdCBwYXJzZXJfZXhlY19zdGF0ZSAqcykKIAkJLyogU3RvcmUgRGF0YSBJbmRleCAqLwogCQlp
ZiAoY21kX3ZhbChzLCAwKSAmICgxIDw8IDIxKSkKIAkJCWluZGV4X21vZGUgPSB0cnVlOwotCQly
ZXQgPSBjbWRfYWRkcmVzc19hdWRpdChzLCBnbWEsIHNpemVvZih1NjQpLCBpbmRleF9tb2RlKTsK
KwkJcmV0ID0gY21kX2FkZHJlc3NfYXVkaXQocywgKGdtYSB8ICgxIDw8IDIpKSwKKwkJCQkJc2l6
ZW9mKHU2NCksIGluZGV4X21vZGUsIDEpOwogCX0KIAkvKiBDaGVjayBub3RpZnkgYml0ICovCiAJ
aWYgKChjbWRfdmFsKHMsIDApICYgKDEgPDwgOCkpKQotLSAKMi4xNy4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcg
bGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
