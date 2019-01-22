Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp6804444ywd;
        Mon, 21 Jan 2019 21:54:50 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4thlYSWlyZb4BdTVrP0JyIyUnnuUpmIZKFDx6dMC4H4XRg5po62kKz6gp0rmFEPnY3rxdH
X-Received: by 2002:a62:36c1:: with SMTP id d184mr32547897pfa.242.1548136489959;
        Mon, 21 Jan 2019 21:54:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548136489; cv=none;
        d=google.com; s=arc-20160816;
        b=MLtSC0YSYfu8a9Ct6OksYVN63iyNEV8JcaFDjvPIHIiCVABBu4Py/VtnbzlbEnuihV
         FgtXauuQFdOOyz+XDQ9sTCRGiLtuV5qPzrkfWdrIW8uoerYVmL40VUaZo793mViLacPV
         XeOArlEQ3IQMfRc9Zin63/MlCHxEtq9E7/k4zm6d+gX5GDCivDGAaQXRIMtOExm7oQZ9
         RN8IqYw41sxpClNVtMsuh86Gc68KET+mCmH+Lk/CIROaePzuV5yeNBKQg89sxzP5GKdn
         dmfOY3NoE63IafUL6b1WxSXUdBqcX1x5VPn4TsLDugFql0TVrIn5XRPOHYFpY2YlahQ9
         G9NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:message-id:date:subject:to:from:delivered-to;
        bh=k91DDVHGfauedAmjfnRu0Ul+zjrQW407n9penHpw+Tk=;
        b=rpJV3ISUYK9zpbPmIJdRGdN59Cy6OAymxyIWmlKeBOytPSYMgiyGC6cYm2bNa/kfyN
         p/xGM0ba/kY96MWhbCoPmevfgPbBmp1rgqPhIZabUf0sNA+49g9cQszxtNixpeYVUqF2
         6xR21HHZZogNwGt1qaii+ajZ016Pl9RpicMj1LROreJPEE7rgRZdn9ZkuGQok7Q6B0JJ
         zpTOwz8BDFqTs6LGq5+ylg9K4umQHjkJ8nwNYzI+7+IydxGTcPRK7IskSBeIzJYYr6if
         r/zhc7omNU1E7vZ6HzQ0OG3nMfZ1mWt2iZMFK1gGQXJDB+0qPe3ThcG+E5qR25ofQKvI
         HfeA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id n30si14351885pgb.406.2019.01.21.21.54.49
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Jan 2019 21:54:49 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA5446E275;
	Tue, 22 Jan 2019 05:54:48 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F9D86E275
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 22 Jan 2019 05:54:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jan 2019 21:54:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,505,1539673200"; d="scan'208";a="108735917"
Received: from weinanli-build.sh.intel.com ([10.239.160.69])
 by orsmga007.jf.intel.com with ESMTP; 21 Jan 2019 21:54:46 -0800
From: Weinan Li <weinan.z.li@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: release shadow batch buffer and wa_ctx before
 destroy one workload
Date: Tue, 22 Jan 2019 13:46:27 +0800
Message-Id: <1548135987-8894-1-git-send-email-weinan.z.li@intel.com>
X-Mailer: git-send-email 1.9.1
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
Cc: Weinan Li <weinan.z.li@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

R1ZULWcgd2lsbCBzaGFkb3cgdGhlIHByaXZpbGVnZSBiYXRjaCBidWZmZXIgYW5kIHRoZSBpbmRp
cmVjdCBjb250ZXh0CmR1cmluZyBjb21tYW5kIHNjYW4sIG1vdmUgdGhlIHJlbGVhc2UgcHJvY2Vz
cyBpbnRvCmludGVsX3ZncHVfZGVzdHJveV93b3JrbG9hZCgpIHRvIGVuc3VyZSB0aGUgcmVzb3Vy
Y2VzIGFyZSByZWN5Y2xlZApwcm9wZXJseS4KCkZpeGVzOiAwY2NlMjgyM2VkMzcgKCJkcm0vaTkx
NS9ndnQva3ZtZ3Q6UmVmaW5lIGVycm9yIGhhbmRsaW5nIGZvciBwcmVwYXJlX2V4ZWNsaXN0X3dv
cmtsb2FkIikKClNpZ25lZC1vZmYtYnk6IFdlaW5hbiBMaSA8d2VpbmFuLnoubGlAaW50ZWwuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9zY2hlZHVsZXIuYyB8IDExICsrKysrKy0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9zY2hlZHVsZXIuYyBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC9zY2hlZHVsZXIuYwppbmRleCA5NWYyNTQ3Li4xYmI4ZjkzIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVyLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3Z0L3NjaGVkdWxlci5jCkBAIC0zMzMsNiArMzMzLDkgQEAgc3RhdGlj
IHZvaWQgcmVsZWFzZV9zaGFkb3dfd2FfY3R4KHN0cnVjdCBpbnRlbF9zaGFkb3dfd2FfY3R4ICp3
YV9jdHgpCiAKIAlpOTE1X2dlbV9vYmplY3RfdW5waW5fbWFwKHdhX2N0eC0+aW5kaXJlY3RfY3R4
Lm9iaik7CiAJaTkxNV9nZW1fb2JqZWN0X3B1dCh3YV9jdHgtPmluZGlyZWN0X2N0eC5vYmopOwor
CisJd2FfY3R4LT5pbmRpcmVjdF9jdHgub2JqID0gTlVMTDsKKwl3YV9jdHgtPmluZGlyZWN0X2N0
eC5zaGFkb3dfdmEgPSBOVUxMOwogfQogCiBzdGF0aWMgaW50IHNldF9jb250ZXh0X3BwZ3R0X2Zy
b21fc2hhZG93KHN0cnVjdCBpbnRlbF92Z3B1X3dvcmtsb2FkICp3b3JrbG9hZCwKQEAgLTkxMiwx
MSArOTE1LDYgQEAgc3RhdGljIHZvaWQgY29tcGxldGVfY3VycmVudF93b3JrbG9hZChzdHJ1Y3Qg
aW50ZWxfZ3Z0ICpndnQsIGludCByaW5nX2lkKQogCiAJbGlzdF9kZWxfaW5pdCgmd29ya2xvYWQt
Pmxpc3QpOwogCi0JaWYgKCF3b3JrbG9hZC0+c3RhdHVzKSB7Ci0JCXJlbGVhc2Vfc2hhZG93X2Jh
dGNoX2J1ZmZlcih3b3JrbG9hZCk7Ci0JCXJlbGVhc2Vfc2hhZG93X3dhX2N0eCgmd29ya2xvYWQt
PndhX2N0eCk7Ci0JfQotCiAJaWYgKHdvcmtsb2FkLT5zdGF0dXMgfHwgKHZncHUtPnJlc2V0dGlu
Z19lbmcgJiBFTkdJTkVfTUFTSyhyaW5nX2lkKSkpIHsKIAkJLyogaWYgd29ya2xvYWQtPnN0YXR1
cyBpcyBub3Qgc3VjY2Vzc2Z1bCBtZWFucyBIVyBHUFUKIAkJICogaGFzIG9jY3VycmVkIEdQVSBo
YW5nIG9yIHNvbWV0aGluZyB3cm9uZyB3aXRoIGk5MTUvR1ZULApAQCAtMTI4Miw2ICsxMjgwLDkg
QEAgdm9pZCBpbnRlbF92Z3B1X2Rlc3Ryb3lfd29ya2xvYWQoc3RydWN0IGludGVsX3ZncHVfd29y
a2xvYWQgKndvcmtsb2FkKQogewogCXN0cnVjdCBpbnRlbF92Z3B1X3N1Ym1pc3Npb24gKnMgPSAm
d29ya2xvYWQtPnZncHUtPnN1Ym1pc3Npb247CiAKKwlyZWxlYXNlX3NoYWRvd19iYXRjaF9idWZm
ZXIod29ya2xvYWQpOworCXJlbGVhc2Vfc2hhZG93X3dhX2N0eCgmd29ya2xvYWQtPndhX2N0eCk7
CisKIAlpZiAod29ya2xvYWQtPnNoYWRvd19tbSkKIAkJaW50ZWxfdmdwdV9tbV9wdXQod29ya2xv
YWQtPnNoYWRvd19tbSk7CiAKLS0gCjEuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQt
ZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXYK
