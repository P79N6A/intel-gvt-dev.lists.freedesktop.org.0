Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp2417527ywo;
        Wed, 3 Apr 2019 00:01:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyq0ay7eihlVORFjtSSFvDZNGIP6GSDXRVC+35HbEcsm4W5tEvYsprvtgW1LMn2NkDxiJg9
X-Received: by 2002:a17:902:70cc:: with SMTP id l12mr56969540plt.10.1554274871605;
        Wed, 03 Apr 2019 00:01:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554274871; cv=none;
        d=google.com; s=arc-20160816;
        b=tNbcP4l21GYdrHfaau42ntSdlpyf491yUXYrx0beX8KVHu6BppUHm2y7Fw/wStZaLi
         4tGioHc0gS8Y/6lL/nLry8t8w7YOvn1j9uZSGC334/LnoVQh12eE8U59wP+V7+YMZjxg
         iWL+F95X0YM4yDVdLEDMjP9Pz4nEo8+30wclaA7sYf0vV3MwMUFbOqio8IF9TBwmunUX
         FMhuvZsqNuNTdGwAKUeVeYH+ZorIHMAnYVBLMhFA/NOuUnVUBgJAcKd6ZsR5cNVia3D9
         LDQMKRibiOevyArFcr2XBlPZUXCZ+wnOXzwSu+++8NNbgKxMs0zxk396WF/aMIwY616M
         50SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:message-id:date:subject:to:from:delivered-to;
        bh=becg8JGXjV9uQoOrxmAeqZC9RXPk3f0HFRjqtVVPKmI=;
        b=DOXKzRtANAJvldCAtxLSkCtnIZlHxP1uMU0Pa6BN4d6cX9cpA5ojC9eia6vth6xqJd
         z1PM+BMYQbrv0wGNUm7tFU+IqZDQlkFloMK0swi39iBpUTNSw3YYyQzPWIbOvZKH3c+D
         I26fvoefwr2fu1oV4a4W4lXutytU18flxdtLK7Ahxn7PQnANuNI05xDe1EtpFcr4XuXX
         zIJCmW+6Ps8J84rMOmHR52gVVjSEwF4r9vOr78nUEwiI9ol3CArHIA/i01VI7mNBhnau
         opNuvYfj9FrX4aeD9bJ2YqY8bYQaoLo0YqAXaZRxBZauur5aDoNGKQTwluvwpiBtRgQJ
         Id1w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id y8si3955848plt.119.2019.04.03.00.01.10
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Apr 2019 00:01:11 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD3886E947;
	Wed,  3 Apr 2019 07:01:10 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 962B26E948
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  3 Apr 2019 07:01:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Apr 2019 00:01:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,303,1549958400"; d="scan'208";a="132536580"
Received: from unknown (HELO xzhan34-rh.bj.intel.com) ([10.238.154.52])
 by orsmga006.jf.intel.com with ESMTP; 03 Apr 2019 00:01:08 -0700
From: Xiaolin Zhang <xiaolin.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v4] drm/i915/gvt: addressed guest GPU hang with HWS index mode
Date: Wed,  3 Apr 2019 15:04:39 +0800
Message-Id: <20190403070439.10595-1-xiaolin.zhang@intel.com>
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
aGFuCmFkZHJlc3NlcyIpCgp2NDogY2FsbCBjbWRfYWRkcmVzc19hdWRpdCBmb3IgbmV3IGFkZHJl
c3MgY29udmVydGVkIGZyb20gaW5kZXguCnYzOiBoYW5kbGUgaW5kZXggbW9kZSB0byBnbWEgY29u
dmVyc2lvbiB3aXRoaW4gY21kIGhhbmRsZXIgaXRzZWxmLgp2MjogUElQRV9DVFJMIGFuZCBNSV9G
TFVTSF9EVyBoYXMgZGlmZmVyZW50IGFkZHJlc3Mgb2Zmc2V0LCBvZmZzZXQgaXMKYWxzbyBwYXNz
ZWQgZm9yIGdtYSBhZGRyZXNzIHVwZGF0ZS4gPHpoZW55dT4KClNpZ25lZC1vZmYtYnk6IFhpYW9s
aW4gWmhhbmcgPHhpYW9saW4uemhhbmdAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2d2dC9jbWRfcGFyc2VyLmMgfCAzMiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0t
LQogMSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIuYyBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC9jbWRfcGFyc2VyLmMKaW5kZXggYjQyMDkxOTI3OWM3Li43ZTVkNDVj
MTE5MjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9jbWRfcGFyc2VyLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIuYwpAQCAtMTA3Nyw2ICsx
MDc3LDggQEAgc3RhdGljIGludCBjbWRfaGFuZGxlcl9waXBlX2NvbnRyb2woc3RydWN0IHBhcnNl
cl9leGVjX3N0YXRlICpzKQogCWJvb2wgaW5kZXhfbW9kZSA9IGZhbHNlOwogCXVuc2lnbmVkIGlu
dCBwb3N0X3N5bmM7CiAJaW50IHJldCA9IDA7CisJdTMyIGh3c19ncGE7CisJdTMyIHZhbDsKIAog
CXBvc3Rfc3luYyA9IChjbWRfdmFsKHMsIDEpICYgUElQRV9DT05UUk9MX1BPU1RfU1lOQ19PUF9N
QVNLKSA+PiAxNDsKIApAQCAtMTA5OCw4ICsxMTAwLDE5IEBAIHN0YXRpYyBpbnQgY21kX2hhbmRs
ZXJfcGlwZV9jb250cm9sKHN0cnVjdCBwYXJzZXJfZXhlY19zdGF0ZSAqcykKIAkJCQkvKiBTdG9y
ZSBEYXRhIEluZGV4ICovCiAJCQkJaWYgKGNtZF92YWwocywgMSkgJiAoMSA8PCAyMSkpCiAJCQkJ
CWluZGV4X21vZGUgPSB0cnVlOwotCQkJCXJldCB8PSBjbWRfYWRkcmVzc19hdWRpdChzLCBnbWEs
IHNpemVvZih1NjQpLAotCQkJCQkJaW5kZXhfbW9kZSk7CisJCQkJaWYgKGluZGV4X21vZGUpIHsK
KwkJCQkJaHdzX2dwYSA9IHMtPnZncHUtPmh3c19wZ2Fbcy0+cmluZ19pZF07CisJCQkJCWdtYSA9
IGh3c19ncGEgKyBnbWE7CisJCQkJCXJldCA9IGNtZF9hZGRyZXNzX2F1ZGl0KHMsIGdtYSwKKwkJ
CQkJCQlzaXplb2YodTY0KSwgZmFsc2UpOworCQkJCQlpZiAocmV0KQorCQkJCQkJcmV0dXJuIHJl
dDsKKwkJCQkJcGF0Y2hfdmFsdWUocywgY21kX3B0cihzLCAyKSwgZ21hKTsKKwkJCQkJdmFsID0g
Y21kX3ZhbChzLCAxKSAmICh+KDEgPDwgMjEpKTsKKwkJCQkJcGF0Y2hfdmFsdWUocywgY21kX3B0
cihzLCAxKSwgdmFsKTsKKwkJCQl9IGVsc2UKKwkJCQkJcmV0IHw9IGNtZF9hZGRyZXNzX2F1ZGl0
KHMsIGdtYSwKKwkJCQkJCXNpemVvZih1NjQpLCBpbmRleF9tb2RlKTsKIAkJCX0KIAkJfQogCX0K
QEAgLTE1OTgsNiArMTYxMSw4IEBAIHN0YXRpYyBpbnQgY21kX2hhbmRsZXJfbWlfZmx1c2hfZHco
c3RydWN0IHBhcnNlcl9leGVjX3N0YXRlICpzKQogCXVuc2lnbmVkIGxvbmcgZ21hOwogCWJvb2wg
aW5kZXhfbW9kZSA9IGZhbHNlOwogCWludCByZXQgPSAwOworCXUzMiBod3NfZ3BhOworCXUzMiB2
YWw7CiAKIAkvKiBDaGVjayBwb3N0LXN5bmMgYW5kIHBwZ3R0IGJpdCAqLwogCWlmICgoKGNtZF92
YWwocywgMCkgPj4gMTQpICYgMHgzKSAmJiAoY21kX3ZhbChzLCAxKSAmICgxIDw8IDIpKSkgewpA
QCAtMTYwNyw3ICsxNjIyLDE4IEBAIHN0YXRpYyBpbnQgY21kX2hhbmRsZXJfbWlfZmx1c2hfZHco
c3RydWN0IHBhcnNlcl9leGVjX3N0YXRlICpzKQogCQkvKiBTdG9yZSBEYXRhIEluZGV4ICovCiAJ
CWlmIChjbWRfdmFsKHMsIDApICYgKDEgPDwgMjEpKQogCQkJaW5kZXhfbW9kZSA9IHRydWU7Ci0J
CXJldCA9IGNtZF9hZGRyZXNzX2F1ZGl0KHMsIGdtYSwgc2l6ZW9mKHU2NCksIGluZGV4X21vZGUp
OworCQlpZiAoaW5kZXhfbW9kZSkgeworCQkJaHdzX2dwYSA9IHMtPnZncHUtPmh3c19wZ2Fbcy0+
cmluZ19pZF07CisJCQlnbWEgPSBod3NfZ3BhICsgZ21hOworCQkJcmV0ID0gY21kX2FkZHJlc3Nf
YXVkaXQocywgZ21hLCBzaXplb2YodTY0KSwgZmFsc2UpOworCQkJaWYgKHJldCkKKwkJCQlyZXR1
cm4gcmV0OworCQkJcGF0Y2hfdmFsdWUocywgY21kX3B0cihzLCAxKSwgZ21hKTsKKwkJCXZhbCA9
IGNtZF92YWwocywgMCkgJiAofigxIDw8IDIxKSk7CisJCQlwYXRjaF92YWx1ZShzLCBjbWRfcHRy
KHMsIDApLCB2YWwpOworCQl9IGVsc2UKKwkJCXJldCA9IGNtZF9hZGRyZXNzX2F1ZGl0KHMsIGdt
YSwKKwkJCQkJc2l6ZW9mKHU2NCksIGluZGV4X21vZGUpOwogCX0KIAkvKiBDaGVjayBub3RpZnkg
Yml0ICovCiAJaWYgKChjbWRfdmFsKHMsIDApICYgKDEgPDwgOCkpKQotLSAKMi4xNS4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2
IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
