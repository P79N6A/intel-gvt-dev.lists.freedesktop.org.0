Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp1055452ywe;
        Thu, 21 Feb 2019 21:49:46 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYFUWWBOYSwNZ/kPsQ53OGIowL1aerW/g6Eage+27lr/WvLCg+J5na5DEVDQDIa72qDPVRd
X-Received: by 2002:a63:2c8a:: with SMTP id s132mr2340301pgs.440.1550814586754;
        Thu, 21 Feb 2019 21:49:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550814586; cv=none;
        d=google.com; s=arc-20160816;
        b=eYB6/yjFoXTdv8V3KC78t1AnTUIFNDUQ5mB3PuWv7hsNzVtT76YRLTlyG2iSwmvj7E
         /AVuuXfArSmbb/HnAXnhLNHGb6fpOFtgvTzpIGIfD3RnuOjuU2X8hSClQp6Hkhs3xU+Y
         ufZpViInK2DJKp26MtQuF2FMCdIfAuXow5Klx6MR2BGQGxdoQ7gz5PF7WvHsSNb6iiZ/
         SI1ftKERBCfkg47Wxk7zNma79cJF02B/wQVVPCE83rCgoLmOdYfoPKaLHxSccKyhkd8J
         qnVUtoIwgvn7VMSocObfRwBu1lwL0nBOcdmPURXExbfOIxv20NO0wTn3vkTmcf/Efvw3
         1z1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=ZryDSG1b9sKsKFMkgo6JSN8Lx84CcuRlSG52iftDRX8=;
        b=tKVPNmlLTovpwjNoUw4vxNy66pLEsSjAlP8OHXll446VwdW9u0Aj1paUqAXzLtxKTT
         DKRdGeNFP+EYf/WcD2em8MAmNJER1N+M/2+5lKJKPSqgmomompG21oKpTB1X5MMvgcZg
         Tnp3szsfHsj+qFveXou3Wh1pri85Ayd9BoIqnU0/uuyJoJajD7aFDfgWLLnIWzvw6oXc
         0HxruQ3Y5ZzYLn0Cl62oa97nUQ7K13M9T6vBheWrblCncDzvE6v+Bx5SK3yYS1B6gPZz
         WlYlda2xA941LVTTKKiWWrTNvoI9cCzXdDJw9e39R6GNLPhThAMVNs1yrH11uJAAvNKW
         dHLg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id x15si590174pgq.378.2019.02.21.21.49.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Feb 2019 21:49:46 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4793E89289;
	Fri, 22 Feb 2019 05:49:46 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C03389296
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 22 Feb 2019 05:49:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1EBD0307D985;
 Fri, 22 Feb 2019 05:49:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-228.ams2.redhat.com
 [10.36.116.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7EECF6014E;
 Fri, 22 Feb 2019 05:49:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9663A11AB8; Fri, 22 Feb 2019 06:49:39 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/3] vfio/display: delay link up event
Date: Fri, 22 Feb 2019 06:49:39 +0100
Message-Id: <20190222054939.19739-4-kraxel@redhat.com>
In-Reply-To: <20190222054939.19739-1-kraxel@redhat.com>
References: <20190222054939.19739-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Fri, 22 Feb 2019 05:49:45 +0000 (UTC)
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
Cc: Alex Williamson <alex.williamson@redhat.com>,
 intel-gvt-dev@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

S2ljayB0aGUgZGlzcGxheSBsaW5rIHVwIGV2ZW50IHdpdGggYSAwLjEgc2VjIGRlbGF5LApzbyB0
aGUgZ3Vlc3QgaGFzIGEgY2hhbmNlIHRvIG5vdGljZSB0aGUgbGluayBkb3duIGZpcnN0LgoKU2ln
bmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Ci0tLQogaW5jbHVk
ZS9ody92ZmlvL3ZmaW8tY29tbW9uLmggfCAgMSArCiBody92ZmlvL2Rpc3BsYXkuYyAgICAgICAg
ICAgICB8IDI2ICsrKysrKysrKysrKysrKysrKysrKysrLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDI0
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ody92
ZmlvL3ZmaW8tY29tbW9uLmggYi9pbmNsdWRlL2h3L3ZmaW8vdmZpby1jb21tb24uaAppbmRleCA1
ZjdmNzA5Yjk1ZjEuLmI2NWEyZjA1MTg4NiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9ody92ZmlvL3Zm
aW8tY29tbW9uLmgKKysrIGIvaW5jbHVkZS9ody92ZmlvL3ZmaW8tY29tbW9uLmgKQEAgLTE1MSw2
ICsxNTEsNyBAQCB0eXBlZGVmIHN0cnVjdCBWRklPRGlzcGxheSB7CiAgICAgc3RydWN0IHZmaW9f
cmVnaW9uX2luZm8gKmVkaWRfaW5mbzsKICAgICBzdHJ1Y3QgdmZpb19yZWdpb25fZ2Z4X2VkaWQg
KmVkaWRfcmVnczsKICAgICB1aW50OF90ICplZGlkX2Jsb2I7CisgICAgUUVNVVRpbWVyICplZGlk
X2xpbmtfdGltZXI7CiAgICAgc3RydWN0IHsKICAgICAgICAgVkZJT1JlZ2lvbiBidWZmZXI7CiAg
ICAgICAgIERpc3BsYXlTdXJmYWNlICpzdXJmYWNlOwpkaWZmIC0tZ2l0IGEvaHcvdmZpby9kaXNw
bGF5LmMgYi9ody92ZmlvL2Rpc3BsYXkuYwppbmRleCA4YmY3Yzg5MGJlOTYuLjk3MWU4MDFkYzA1
YyAxMDA2NDQKLS0tIGEvaHcvdmZpby9kaXNwbGF5LmMKKysrIGIvaHcvdmZpby9kaXNwbGF5LmMK
QEAgLTM4LDYgKzM4LDIxIEBACiAgICAgICAgIGdvdG8gZXJyOwogCiAKK3N0YXRpYyB2b2lkIHZm
aW9fZGlzcGxheV9lZGlkX2xpbmtfdXAodm9pZCAqb3BhcXVlKQoreworICAgIFZGSU9QQ0lEZXZp
Y2UgKnZkZXYgPSBvcGFxdWU7CisgICAgVkZJT0Rpc3BsYXkgKmRweSA9IHZkZXYtPmRweTsKKyAg
ICBpbnQgZmQgPSB2ZGV2LT52YmFzZWRldi5mZDsKKworICAgIGRweS0+ZWRpZF9yZWdzLT5saW5r
X3N0YXRlID0gVkZJT19ERVZJQ0VfR0ZYX0xJTktfU1RBVEVfVVA7CisgICAgcHdyaXRlX2ZpZWxk
KGZkLCBkcHktPmVkaWRfaW5mbywgZHB5LT5lZGlkX3JlZ3MsIGxpbmtfc3RhdGUpOworICAgIHRy
YWNlX3ZmaW9fZGlzcGxheV9lZGlkX2xpbmtfdXAoKTsKKyAgICByZXR1cm47CisKK2VycjoKKyAg
ICB0cmFjZV92ZmlvX2Rpc3BsYXlfZWRpZF93cml0ZV9lcnJvcigpOworfQorCiBzdGF0aWMgdm9p
ZCB2ZmlvX2Rpc3BsYXlfZWRpZF91cGRhdGUoVkZJT1BDSURldmljZSAqdmRldiwgYm9vbCBlbmFi
bGVkLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCBwcmVmeCwgaW50
IHByZWZ5KQogewpAQCAtNTAsNiArNjUsNyBAQCBzdGF0aWMgdm9pZCB2ZmlvX2Rpc3BsYXlfZWRp
ZF91cGRhdGUoVkZJT1BDSURldmljZSAqdmRldiwgYm9vbCBlbmFibGVkLAogICAgICAgICAucHJl
ZnkgPSBwcmVmeSA/OiB2ZGV2LT5kaXNwbGF5X3lyZXMsCiAgICAgfTsKIAorICAgIHRpbWVyX2Rl
bChkcHktPmVkaWRfbGlua190aW1lcik7CiAgICAgZHB5LT5lZGlkX3JlZ3MtPmxpbmtfc3RhdGUg
PSBWRklPX0RFVklDRV9HRlhfTElOS19TVEFURV9ET1dOOwogICAgIHB3cml0ZV9maWVsZChmZCwg
ZHB5LT5lZGlkX2luZm8sIGRweS0+ZWRpZF9yZWdzLCBsaW5rX3N0YXRlKTsKICAgICB0cmFjZV92
ZmlvX2Rpc3BsYXlfZWRpZF9saW5rX2Rvd24oKTsKQEAgLTc3LDkgKzkzLDggQEAgc3RhdGljIHZv
aWQgdmZpb19kaXNwbGF5X2VkaWRfdXBkYXRlKFZGSU9QQ0lEZXZpY2UgKnZkZXYsIGJvb2wgZW5h
YmxlZCwKICAgICAgICAgZ290byBlcnI7CiAgICAgfQogCi0gICAgZHB5LT5lZGlkX3JlZ3MtPmxp
bmtfc3RhdGUgPSBWRklPX0RFVklDRV9HRlhfTElOS19TVEFURV9VUDsKLSAgICBwd3JpdGVfZmll
bGQoZmQsIGRweS0+ZWRpZF9pbmZvLCBkcHktPmVkaWRfcmVncywgbGlua19zdGF0ZSk7Ci0gICAg
dHJhY2VfdmZpb19kaXNwbGF5X2VkaWRfbGlua191cCgpOworICAgIHRpbWVyX21vZChkcHktPmVk
aWRfbGlua190aW1lciwKKyAgICAgICAgICAgICAgcWVtdV9jbG9ja19nZXRfbXMoUUVNVV9DTE9D
S19SRUFMVElNRSkgKyAxMDApOwogICAgIHJldHVybjsKIAogZXJyOgpAQCAtMTM2LDYgKzE1MSw5
IEBAIHN0YXRpYyB2b2lkIHZmaW9fZGlzcGxheV9lZGlkX2luaXQoVkZJT1BDSURldmljZSAqdmRl
dikKICAgICAgICAgdmRldi0+ZGlzcGxheV95cmVzID0gZHB5LT5lZGlkX3JlZ3MtPm1heF95cmVz
OwogICAgIH0KIAorICAgIGRweS0+ZWRpZF9saW5rX3RpbWVyID0gdGltZXJfbmV3X21zKFFFTVVf
Q0xPQ0tfUkVBTFRJTUUsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dmZpb19kaXNwbGF5X2VkaWRfbGlua191cCwgdmRldik7CisKICAgICB2ZmlvX2Rpc3BsYXlfZWRp
ZF91cGRhdGUodmRldiwgdHJ1ZSwgMCwgMCk7CiAgICAgcmV0dXJuOwogCkBAIC0xNTQsNiArMTcy
LDggQEAgc3RhdGljIHZvaWQgdmZpb19kaXNwbGF5X2VkaWRfZXhpdChWRklPRGlzcGxheSAqZHB5
KQogCiAgICAgZ19mcmVlKGRweS0+ZWRpZF9yZWdzKTsKICAgICBnX2ZyZWUoZHB5LT5lZGlkX2Js
b2IpOworICAgIHRpbWVyX2RlbChkcHktPmVkaWRfbGlua190aW1lcik7CisgICAgdGltZXJfZnJl
ZShkcHktPmVkaWRfbGlua190aW1lcik7CiB9CiAKIHN0YXRpYyB2b2lkIHZmaW9fZGlzcGxheV91
cGRhdGVfY3Vyc29yKFZGSU9ETUFCdWYgKmRtYWJ1ZiwKLS0gCjIuOS4zCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcg
bGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
