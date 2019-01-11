Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp2754663ywd;
        Fri, 11 Jan 2019 01:31:25 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6IdoUHdbWJS+b+6wXfS4oOVp88Z/DduAUObN7czMJwZJvDQRLn4VUAUh+dD8hl5uaxJgzO
X-Received: by 2002:a62:5d0c:: with SMTP id r12mr14319266pfb.0.1547199085603;
        Fri, 11 Jan 2019 01:31:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547199085; cv=none;
        d=google.com; s=arc-20160816;
        b=Tz2/xjdM5OcqUmPpBBcd2rcDy3DGFJTt1jhcZXgG11H1fDPCKsFrqByo26SMM2k6R/
         +nJBze4AP9qrFMbkii+QMZRI3Swziv2dawpo+t4eVt/FPY9spIG3w6GqPHnUWKg7z6mX
         Igd/V2IaEvZVceogbES7Z3r+MH+uyPNLdnYm+WXorkuvTLKxkZHo1xxuBkghb1ZtwIA0
         RbE9A02Ox8hpvlUErngt/65mcPie0Eba/SvyfnJn2H2I2PEUiuMs9WU5dhrxvA4goO7y
         TdEqistaISt2NEQ3Ljwp4wrprk9bUK2Ct5GxSxB5L07MQ3ew5MYlCVQ7tBhlnSzyi/0F
         Fxqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=iVbaJY1LidRWHDu8Vy68ea19m1B7tNPVh7p5PBQVJ+U=;
        b=rjC0+Xa/4iqcyjx6ht5HOj8HAiSYt21GniOLSTPiS5FD+qOrRkw7CKWvvEonjsEjk3
         UE4IK9xirp1zPdzcnaZSJN3CCYT/oxWkHelOjHUH/4b7d9gDIZ/eAKDLPGiX6Abg33xY
         bPZkn5w0w7koiUCFKEkyb3VCRqj3OVsGO3yrTHrp4MorThGEPPy/HqPneSlr4boe+90V
         qwn2PnvJLj8z4GW4jlN3PMu8tNmT1PiVfD1cWM2QqyruJaFY7v4SbHC8LsbRS480TUrc
         JRXOReBu0gySDof5KA8Iu0xnFmXZmJrO2QJnUvFrYpjniArC+OHZjYJTAzj5xHM7rGTZ
         qfVw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id v75si19237580pfd.157.2019.01.11.01.31.25
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Jan 2019 01:31:25 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3083D6F5B4;
	Fri, 11 Jan 2019 09:31:25 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F050E6F5B4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 11 Jan 2019 09:31:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 60EF3A7893;
 Fri, 11 Jan 2019 09:31:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-186.ams2.redhat.com
 [10.36.117.186])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2596E1714B;
 Fri, 11 Jan 2019 09:31:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 763B09AD9; Fri, 11 Jan 2019 10:31:16 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] vfio/display: delay link up event
Date: Fri, 11 Jan 2019 10:31:15 +0100
Message-Id: <20190111093116.17188-5-kraxel@redhat.com>
In-Reply-To: <20190111093116.17188-1-kraxel@redhat.com>
References: <20190111093116.17188-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Fri, 11 Jan 2019 09:31:23 +0000 (UTC)
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
ICAgICB8IDIyICsrKysrKysrKysrKysrKysrKysrLS0KIDIgZmlsZXMgY2hhbmdlZCwgMjEgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2h3L3ZmaW8v
dmZpby1jb21tb24uaCBiL2luY2x1ZGUvaHcvdmZpby92ZmlvLWNvbW1vbi5oCmluZGV4IGZmNWM0
MjUwNDguLjllMjlkNTgxMGUgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvaHcvdmZpby92ZmlvLWNvbW1v
bi5oCisrKyBiL2luY2x1ZGUvaHcvdmZpby92ZmlvLWNvbW1vbi5oCkBAIC0xNTEsNiArMTUxLDcg
QEAgdHlwZWRlZiBzdHJ1Y3QgVkZJT0Rpc3BsYXkgewogICAgIHN0cnVjdCB2ZmlvX3JlZ2lvbl9p
bmZvICplZGlkX2luZm87CiAgICAgc3RydWN0IHZmaW9fcmVnaW9uX2dmeF9lZGlkICplZGlkX3Jl
Z3M7CiAgICAgdWludDhfdCAqZWRpZF9ibG9iOworICAgIFFFTVVUaW1lciAqZWRpZF9saW5rX3Rp
bWVyOwogICAgIHN0cnVjdCB7CiAgICAgICAgIFZGSU9SZWdpb24gYnVmZmVyOwogICAgICAgICBE
aXNwbGF5U3VyZmFjZSAqc3VyZmFjZTsKZGlmZiAtLWdpdCBhL2h3L3ZmaW8vZGlzcGxheS5jIGIv
aHcvdmZpby9kaXNwbGF5LmMKaW5kZXggM2ExMDA3MjgyMy4uYTNhNzEwYjNlZSAxMDA2NDQKLS0t
IGEvaHcvdmZpby9kaXNwbGF5LmMKKysrIGIvaHcvdmZpby9kaXNwbGF5LmMKQEAgLTM3LDYgKzM3
LDE5IEBACiAgICAgICAgIGdvdG8gZXJyOwogCiAKK3N0YXRpYyB2b2lkIHZmaW9fZGlzcGxheV9l
ZGlkX2xpbmtfdXAodm9pZCAqb3BhcXVlKQoreworICAgIFZGSU9QQ0lEZXZpY2UgKnZkZXYgPSBv
cGFxdWU7CisgICAgVkZJT0Rpc3BsYXkgKmRweSA9IHZkZXYtPmRweTsKKworICAgIGRweS0+ZWRp
ZF9yZWdzLT5saW5rX3N0YXRlID0gVkZJT19ERVZJQ0VfR0ZYX0xJTktfU1RBVEVfVVA7CisgICAg
cHdyaXRlX2ZpZWxkKHZkZXYtPnZiYXNlZGV2LmZkLCBkcHktPmVkaWRfaW5mbywgZHB5LT5lZGlk
X3JlZ3MsIGxpbmtfc3RhdGUpOworICAgIHJldHVybjsKKworZXJyOgorICAgIGZwcmludGYoc3Rk
ZXJyLCAiJXM6IE9vcHMsIHB3cml0ZSBlcnJvclxuIiwgX19mdW5jX18pOworfQorCiBzdGF0aWMg
dm9pZCB2ZmlvX2Rpc3BsYXlfZWRpZF91cGRhdGUoVkZJT1BDSURldmljZSAqdmRldiwgYm9vbCBl
bmFibGVkLCBpbnQgcHJlZngsIGludCBwcmVmeSkKIHsKICAgICBWRklPRGlzcGxheSAqZHB5ID0g
dmRldi0+ZHB5OwpAQCAtNDcsNiArNjAsNyBAQCBzdGF0aWMgdm9pZCB2ZmlvX2Rpc3BsYXlfZWRp
ZF91cGRhdGUoVkZJT1BDSURldmljZSAqdmRldiwgYm9vbCBlbmFibGVkLCBpbnQgcHJlZgogICAg
ICAgICAucHJlZnkgPSBwcmVmeSA/OiB2ZGV2LT5kaXNwbGF5X3lyZXMsCiAgICAgfTsKIAorICAg
IHRpbWVyX2RlbChkcHktPmVkaWRfbGlua190aW1lcik7CiAgICAgZHB5LT5lZGlkX3JlZ3MtPmxp
bmtfc3RhdGUgPSBWRklPX0RFVklDRV9HRlhfTElOS19TVEFURV9ET1dOOwogICAgIHB3cml0ZV9m
aWVsZCh2ZGV2LT52YmFzZWRldi5mZCwgZHB5LT5lZGlkX2luZm8sIGRweS0+ZWRpZF9yZWdzLCBs
aW5rX3N0YXRlKTsKIApAQCAtNzIsOCArODYsNyBAQCBzdGF0aWMgdm9pZCB2ZmlvX2Rpc3BsYXlf
ZWRpZF91cGRhdGUoVkZJT1BDSURldmljZSAqdmRldiwgYm9vbCBlbmFibGVkLCBpbnQgcHJlZgog
ICAgICAgICBnb3RvIGVycjsKICAgICB9CiAKLSAgICBkcHktPmVkaWRfcmVncy0+bGlua19zdGF0
ZSA9IFZGSU9fREVWSUNFX0dGWF9MSU5LX1NUQVRFX1VQOwotICAgIHB3cml0ZV9maWVsZCh2ZGV2
LT52YmFzZWRldi5mZCwgZHB5LT5lZGlkX2luZm8sIGRweS0+ZWRpZF9yZWdzLCBsaW5rX3N0YXRl
KTsKKyAgICB0aW1lcl9tb2QoZHB5LT5lZGlkX2xpbmtfdGltZXIsIHFlbXVfY2xvY2tfZ2V0X21z
KFFFTVVfQ0xPQ0tfUkVBTFRJTUUpICsgMTAwKTsKICAgICByZXR1cm47CiAKIGVycjoKQEAgLTEy
Niw2ICsxMzksOSBAQCBzdGF0aWMgdm9pZCB2ZmlvX2Rpc3BsYXlfZWRpZF9pbml0KFZGSU9QQ0lE
ZXZpY2UgKnZkZXYpCiAgICAgaWYgKCF2ZGV2LT5kaXNwbGF5X3lyZXMpCiAgICAgICAgIHZkZXYt
PmRpc3BsYXlfeXJlcyA9IGRweS0+ZWRpZF9yZWdzLT5tYXhfeXJlczsKIAorICAgIGRweS0+ZWRp
ZF9saW5rX3RpbWVyID0gdGltZXJfbmV3X21zKFFFTVVfQ0xPQ0tfUkVBTFRJTUUsCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdmZpb19kaXNwbGF5X2VkaWRfbGlua191
cCwgdmRldik7CisKICAgICB2ZmlvX2Rpc3BsYXlfZWRpZF91cGRhdGUodmRldiwgdHJ1ZSwgMCwg
MCk7CiAgICAgcmV0dXJuOwogCkBAIC0xNDMsNiArMTU5LDggQEAgc3RhdGljIHZvaWQgdmZpb19k
aXNwbGF5X2VkaWRfZXhpdChWRklPRGlzcGxheSAqZHB5KQogCiAgICAgZ19mcmVlKGRweS0+ZWRp
ZF9yZWdzKTsKICAgICBnX2ZyZWUoZHB5LT5lZGlkX2Jsb2IpOworICAgIHRpbWVyX2RlbChkcHkt
PmVkaWRfbGlua190aW1lcik7CisgICAgdGltZXJfZnJlZShkcHktPmVkaWRfbGlua190aW1lcik7
CiB9CiAKIHN0YXRpYyB2b2lkIHZmaW9fZGlzcGxheV91cGRhdGVfY3Vyc29yKFZGSU9ETUFCdWYg
KmRtYWJ1ZiwKLS0gCjIuOS4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2ludGVsLWd2dC1kZXYK
