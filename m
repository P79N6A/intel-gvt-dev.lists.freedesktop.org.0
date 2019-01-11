Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp2754661ywd;
        Fri, 11 Jan 2019 01:31:25 -0800 (PST)
X-Google-Smtp-Source: ALg8bN45xytdQSWT5PZ/KS9PUkc+gkh31zQPLEr/auG5moo06Fk1iL1XBhXoejMRjINER4BGYqar
X-Received: by 2002:a17:902:6948:: with SMTP id k8mr13753018plt.2.1547199085539;
        Fri, 11 Jan 2019 01:31:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547199085; cv=none;
        d=google.com; s=arc-20160816;
        b=o0SJlg0/8L50y7J3uM7FbkTibA9jGKIoX1MLu+r35K4o/MK9eYJMgTpO+SYviWuUDz
         dDQgF3x1Ud2HwnILKaGuGY4smYKCv1u38RAdGBt3iD9hn/hh2Ez+586m3Pj1Nmu3HaSw
         o2O2DGcFGN7tnUDDRS/LxBHQ/AIrocNVoeQ3MyGZSIjEx/6qI/Tz48vrzpXu13nUmkWs
         jwQUlfOv70bqcgmtmJH35gp0SNRcQiWzbPe1h06ovq+rSt5B7Y81R1ADjOzG+bIcqHFW
         VLLKDMq+6x/J1rhaMSo6NshVP3BsAWG5Tn2bBJ28mnzdZuM6kefcMJ30z5+bOziQSF2o
         7dxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=YKBADEB1x8A/TUNElOrP0rY7ciBZqgYPtcOBtuQG+EA=;
        b=UUyqkAB13hrZQd4/3QlG/AdPuGmSjU9rCBGHBSZ8vvr3gJlLULM158qo5eRGFLb6Q5
         mKycbyNGniMpGIQvEhSTpIVAtOUHoDZK5IeGXdfm0CZrjhem8jx3bzTxMWHmyBPU1oDD
         Acnzh+nHLYxzU8a+ao6FmEwiJzXeFrRbrYVCg4Sf3sofD6NAWdKqXMVZuPfjZWDstZPJ
         nlAdmD3ZU4sJAh5zC0FVEs5yr86myVKu0kiyFn/c2LVl3iNbABVyHNK5H+jAE6NYZZqz
         K9N6liZvgqAxJjR7/gjyIuvcC509pckkcz2Og9RKr1ZyObOAOBR+5rs1xwb3vQKvFj57
         l/Qw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id l23si1469608pgh.533.2019.01.11.01.31.25
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Jan 2019 01:31:25 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B88F6F5B3;
	Fri, 11 Jan 2019 09:31:25 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C2986F5B3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 11 Jan 2019 09:31:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A6854C04F4DD;
 Fri, 11 Jan 2019 09:31:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-186.ams2.redhat.com
 [10.36.117.186])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1CC8E5D6A9;
 Fri, 11 Jan 2019 09:31:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 62EA99AD4; Fri, 11 Jan 2019 10:31:16 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/5] vfio/display: add edid support.
Date: Fri, 11 Jan 2019 10:31:13 +0100
Message-Id: <20190111093116.17188-3-kraxel@redhat.com>
In-Reply-To: <20190111093116.17188-1-kraxel@redhat.com>
References: <20190111093116.17188-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Fri, 11 Jan 2019 09:31:23 +0000 (UTC)
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

VGhpcyBwYXRjaCBhZGRzIEVESUQgc3VwcG9ydCB0byB0aGUgdmZpbyBkaXNwbGF5IChha2Egdmdw
dSkgY29kZS4KV2hlbiBzdXBwb3J0ZWQgYnkgdGhlIG1kZXYgZHJpdmVyIHFlbXUgd2lsbCBnZW5l
cmF0ZSBhIEVESUQgYmxvYgphbmQgcGFzcyBpdCBvbiB1c2luZyB0aGUgbmV3IHZmaW8gZWRpZCBy
ZWdpb24uICBUaGUgRURJRCBibG9iIHdpbGwKYmUgdXBkYXRlZCBvbiBVSSBjaGFuZ2VzIChpLmUu
IHdpbmRvdyByZXNpemUpLCBzbyB0aGUgZ3Vlc3QgY2FuCmFkYXB0LgoKU2lnbmVkLW9mZi1ieTog
R2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Ci0tLQogaW5jbHVkZS9ody92ZmlvL3Zm
aW8tY29tbW9uLmggfCAgIDMgKysKIGh3L3ZmaW8vZGlzcGxheS5jICAgICAgICAgICAgIHwgMTE4
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFu
Z2VkLCAxMjEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvaHcvdmZpby92Zmlv
LWNvbW1vbi5oIGIvaW5jbHVkZS9ody92ZmlvL3ZmaW8tY29tbW9uLmgKaW5kZXggMWI0MzRkMDJm
Ni4uZmY1YzQyNTA0OCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9ody92ZmlvL3ZmaW8tY29tbW9uLmgK
KysrIGIvaW5jbHVkZS9ody92ZmlvL3ZmaW8tY29tbW9uLmgKQEAgLTE0OCw2ICsxNDgsOSBAQCB0
eXBlZGVmIHN0cnVjdCBWRklPRE1BQnVmIHsKIHR5cGVkZWYgc3RydWN0IFZGSU9EaXNwbGF5IHsK
ICAgICBRZW11Q29uc29sZSAqY29uOwogICAgIFJBTUZCU3RhdGUgKnJhbWZiOworICAgIHN0cnVj
dCB2ZmlvX3JlZ2lvbl9pbmZvICplZGlkX2luZm87CisgICAgc3RydWN0IHZmaW9fcmVnaW9uX2dm
eF9lZGlkICplZGlkX3JlZ3M7CisgICAgdWludDhfdCAqZWRpZF9ibG9iOwogICAgIHN0cnVjdCB7
CiAgICAgICAgIFZGSU9SZWdpb24gYnVmZmVyOwogICAgICAgICBEaXNwbGF5U3VyZmFjZSAqc3Vy
ZmFjZTsKZGlmZiAtLWdpdCBhL2h3L3ZmaW8vZGlzcGxheS5jIGIvaHcvdmZpby9kaXNwbGF5LmMK
aW5kZXggZGVhZDMwZTYyNi4uMGVmNGQ3N2UyMSAxMDA2NDQKLS0tIGEvaHcvdmZpby9kaXNwbGF5
LmMKKysrIGIvaHcvdmZpby9kaXNwbGF5LmMKQEAgLTE1LDYgKzE1LDcgQEAKICNpbmNsdWRlIDxz
eXMvaW9jdGwuaD4KIAogI2luY2x1ZGUgInN5c2VtdS9zeXNlbXUuaCIKKyNpbmNsdWRlICJody9k
aXNwbGF5L2VkaWQuaCIKICNpbmNsdWRlICJ1aS9jb25zb2xlLmgiCiAjaW5jbHVkZSAicWFwaS9l
cnJvci5oIgogI2luY2x1ZGUgInBjaS5oIgpAQCAtMjQsNiArMjUsMTIwIEBACiAjIGRlZmluZSBE
Uk1fUExBTkVfVFlQRV9DVVJTT1IgIDIKICNlbmRpZgogCisjZGVmaW5lIHByZWFkX2ZpZWxkKF9m
ZCwgX3JlZywgX3B0ciwgX2ZsZCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCisgICAg
aWYgKHNpemVvZihfcHRyLT5fZmxkKSAhPSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCisgICAgICAgIHByZWFkKF9mZCwgJihfcHRyLT5fZmxkKSwgc2l6ZW9mKF9w
dHItPl9mbGQpLCAgICAgICAgICAgICAgICAgICBcCisgICAgICAgICAgICAgIF9yZWctPm9mZnNl
dCArIG9mZnNldG9mKHR5cGVvZigqX3B0ciksIF9mbGQpKSkgICAgICAgICAgICBcCisgICAgICAg
IGdvdG8gZXJyOworI2RlZmluZSBwd3JpdGVfZmllbGQoX2ZkLCBfcmVnLCBfcHRyLCBfZmxkKSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAorICAgIGlmIChzaXplb2YoX3B0ci0+X2ZsZCkg
IT0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAorICAgICAgICBw
d3JpdGUoX2ZkLCAmKF9wdHItPl9mbGQpLCBzaXplb2YoX3B0ci0+X2ZsZCksICAgICAgICAgICAg
ICAgICAgXAorICAgICAgICAgICAgICAgX3JlZy0+b2Zmc2V0ICsgb2Zmc2V0b2YodHlwZW9mKCpf
cHRyKSwgX2ZsZCkpKSAgICAgICAgICAgXAorICAgICAgICBnb3RvIGVycjsKKworCitzdGF0aWMg
dm9pZCB2ZmlvX2Rpc3BsYXlfZWRpZF91cGRhdGUoVkZJT1BDSURldmljZSAqdmRldiwgYm9vbCBl
bmFibGVkLCBpbnQgcHJlZngsIGludCBwcmVmeSkKK3sKKyAgICBWRklPRGlzcGxheSAqZHB5ID0g
dmRldi0+ZHB5OworICAgIHFlbXVfZWRpZF9pbmZvIGVkaWQgPSB7CisgICAgICAgIC5tYXh4ICA9
IGRweS0+ZWRpZF9yZWdzLT5tYXhfeHJlcywKKyAgICAgICAgLm1heHkgID0gZHB5LT5lZGlkX3Jl
Z3MtPm1heF95cmVzLAorICAgICAgICAucHJlZnggPSBwcmVmeCwKKyAgICAgICAgLnByZWZ5ID0g
cHJlZnksCisgICAgfTsKKworICAgIGRweS0+ZWRpZF9yZWdzLT5saW5rX3N0YXRlID0gVkZJT19E
RVZJQ0VfR0ZYX0xJTktfU1RBVEVfRE9XTjsKKyAgICBwd3JpdGVfZmllbGQodmRldi0+dmJhc2Vk
ZXYuZmQsIGRweS0+ZWRpZF9pbmZvLCBkcHktPmVkaWRfcmVncywgbGlua19zdGF0ZSk7CisKKyAg
ICBpZiAoIWVuYWJsZWQpIHsKKyAgICAgICAgcmV0dXJuOworICAgIH0KKworICAgIGlmIChlZGlk
Lm1heHggJiYgZWRpZC5wcmVmeCA+IGVkaWQubWF4eCkgeworICAgICAgICBlZGlkLnByZWZ4ID0g
ZWRpZC5tYXh4OworICAgIH0KKyAgICBpZiAoZWRpZC5tYXh5ICYmIGVkaWQucHJlZnkgPiBlZGlk
Lm1heHkpIHsKKyAgICAgICAgZWRpZC5wcmVmeSA9IGVkaWQubWF4eTsKKyAgICB9CisgICAgcWVt
dV9lZGlkX2dlbmVyYXRlKGRweS0+ZWRpZF9ibG9iLAorICAgICAgICAgICAgICAgICAgICAgICBk
cHktPmVkaWRfcmVncy0+ZWRpZF9tYXhfc2l6ZSwKKyAgICAgICAgICAgICAgICAgICAgICAgJmVk
aWQpOworCisgICAgZHB5LT5lZGlkX3JlZ3MtPmVkaWRfc2l6ZSA9IHFlbXVfZWRpZF9zaXplKGRw
eS0+ZWRpZF9ibG9iKTsKKyAgICBwd3JpdGVfZmllbGQodmRldi0+dmJhc2VkZXYuZmQsIGRweS0+
ZWRpZF9pbmZvLCBkcHktPmVkaWRfcmVncywgZWRpZF9zaXplKTsKKyAgICBpZiAocHdyaXRlKHZk
ZXYtPnZiYXNlZGV2LmZkLCBkcHktPmVkaWRfYmxvYiwgZHB5LT5lZGlkX3JlZ3MtPmVkaWRfc2l6
ZSwKKyAgICAgICAgICAgICAgIGRweS0+ZWRpZF9pbmZvLT5vZmZzZXQgKyBkcHktPmVkaWRfcmVn
cy0+ZWRpZF9vZmZzZXQpCisgICAgICAgICE9IGRweS0+ZWRpZF9yZWdzLT5lZGlkX3NpemUpIHsK
KyAgICAgICAgZ290byBlcnI7CisgICAgfQorCisgICAgZHB5LT5lZGlkX3JlZ3MtPmxpbmtfc3Rh
dGUgPSBWRklPX0RFVklDRV9HRlhfTElOS19TVEFURV9VUDsKKyAgICBwd3JpdGVfZmllbGQodmRl
di0+dmJhc2VkZXYuZmQsIGRweS0+ZWRpZF9pbmZvLCBkcHktPmVkaWRfcmVncywgbGlua19zdGF0
ZSk7CisgICAgcmV0dXJuOworCitlcnI6CisgICAgZnByaW50ZihzdGRlcnIsICIlczogT29wcywg
cHdyaXRlIGVycm9yXG4iLCBfX2Z1bmNfXyk7CisgICAgcmV0dXJuOworfQorCitzdGF0aWMgaW50
IHZmaW9fZGlzcGxheV9lZGlkX3VpX2luZm8odm9pZCAqb3BhcXVlLCB1aW50MzJfdCBpZHgsCisg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUWVtdVVJSW5mbyAqaW5mbykKK3sK
KyAgICBWRklPUENJRGV2aWNlICp2ZGV2ID0gb3BhcXVlOworICAgIFZGSU9EaXNwbGF5ICpkcHkg
PSB2ZGV2LT5kcHk7CisKKyAgICBpZiAoIWRweS0+ZWRpZF9yZWdzKSB7CisgICAgICAgIHJldHVy
biAwOworICAgIH0KKworICAgIGlmIChpbmZvLT53aWR0aCAmJiBpbmZvLT5oZWlnaHQpIHsKKyAg
ICAgICAgdmZpb19kaXNwbGF5X2VkaWRfdXBkYXRlKHZkZXYsIHRydWUsIGluZm8tPndpZHRoLCBp
bmZvLT5oZWlnaHQpOworICAgIH0gZWxzZSB7CisgICAgICAgIHZmaW9fZGlzcGxheV9lZGlkX3Vw
ZGF0ZSh2ZGV2LCBmYWxzZSwgMCwgMCk7CisgICAgfQorCisgICAgcmV0dXJuIDA7Cit9CisKK3N0
YXRpYyB2b2lkIHZmaW9fZGlzcGxheV9lZGlkX2luaXQoVkZJT1BDSURldmljZSAqdmRldikKK3sK
KyAgICBWRklPRGlzcGxheSAqZHB5ID0gdmRldi0+ZHB5OworICAgIGludCByZXQ7CisKKyAgICBy
ZXQgPSB2ZmlvX2dldF9kZXZfcmVnaW9uX2luZm8oJnZkZXYtPnZiYXNlZGV2LAorICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBWRklPX1JFR0lPTl9UWVBFX0dGWCwKKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgVkZJT19SRUdJT05fU1VCVFlQRV9HRlhfRURJRCwK
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmRweS0+ZWRpZF9pbmZvKTsKKyAg
ICBpZiAocmV0KSB7CisgICAgICAgIHJldHVybjsKKyAgICB9CisKKyAgICBkcHktPmVkaWRfcmVn
cyA9IGdfbmV3MChzdHJ1Y3QgdmZpb19yZWdpb25fZ2Z4X2VkaWQsIDEpOworICAgIHByZWFkX2Zp
ZWxkKHZkZXYtPnZiYXNlZGV2LmZkLCBkcHktPmVkaWRfaW5mbywgZHB5LT5lZGlkX3JlZ3MsIGVk
aWRfb2Zmc2V0KTsKKyAgICBwcmVhZF9maWVsZCh2ZGV2LT52YmFzZWRldi5mZCwgZHB5LT5lZGlk
X2luZm8sIGRweS0+ZWRpZF9yZWdzLCBlZGlkX21heF9zaXplKTsKKyAgICBwcmVhZF9maWVsZCh2
ZGV2LT52YmFzZWRldi5mZCwgZHB5LT5lZGlkX2luZm8sIGRweS0+ZWRpZF9yZWdzLCBtYXhfeHJl
cyk7CisgICAgcHJlYWRfZmllbGQodmRldi0+dmJhc2VkZXYuZmQsIGRweS0+ZWRpZF9pbmZvLCBk
cHktPmVkaWRfcmVncywgbWF4X3lyZXMpOworICAgIGRweS0+ZWRpZF9ibG9iID0gZ19tYWxsb2Mw
KGRweS0+ZWRpZF9yZWdzLT5lZGlkX21heF9zaXplKTsKKworICAgIHZmaW9fZGlzcGxheV9lZGlk
X3VwZGF0ZSh2ZGV2LCB0cnVlLCAwLCAwKTsKKyAgICByZXR1cm47CisKK2VycjoKKyAgICBmcHJp
bnRmKHN0ZGVyciwgIiVzOiBPb3BzLCBwcmVhZCBlcnJvclxuIiwgX19mdW5jX18pOworICAgIGdf
ZnJlZShkcHktPmVkaWRfcmVncyk7CisgICAgZHB5LT5lZGlkX3JlZ3MgPSBOVUxMOworICAgIHJl
dHVybjsKK30KKworc3RhdGljIHZvaWQgdmZpb19kaXNwbGF5X2VkaWRfZXhpdChWRklPRGlzcGxh
eSAqZHB5KQoreworICAgIGlmICghZHB5LT5lZGlkX3JlZ3MpCisgICAgICAgIHJldHVybjsKKwor
ICAgIGdfZnJlZShkcHktPmVkaWRfcmVncyk7CisgICAgZ19mcmVlKGRweS0+ZWRpZF9ibG9iKTsK
K30KKwogc3RhdGljIHZvaWQgdmZpb19kaXNwbGF5X3VwZGF0ZV9jdXJzb3IoVkZJT0RNQUJ1ZiAq
ZG1hYnVmLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHZm
aW9fZGV2aWNlX2dmeF9wbGFuZV9pbmZvICpwbGFuZSkKIHsKQEAgLTE3MSw2ICsyODYsNyBAQCBz
dGF0aWMgdm9pZCB2ZmlvX2Rpc3BsYXlfZG1hYnVmX3VwZGF0ZSh2b2lkICpvcGFxdWUpCiAKIHN0
YXRpYyBjb25zdCBHcmFwaGljSHdPcHMgdmZpb19kaXNwbGF5X2RtYWJ1Zl9vcHMgPSB7CiAgICAg
LmdmeF91cGRhdGUgPSB2ZmlvX2Rpc3BsYXlfZG1hYnVmX3VwZGF0ZSwKKyAgICAudWlfaW5mbyAg
ICA9IHZmaW9fZGlzcGxheV9lZGlkX3VpX2luZm8sCiB9OwogCiBzdGF0aWMgaW50IHZmaW9fZGlz
cGxheV9kbWFidWZfaW5pdChWRklPUENJRGV2aWNlICp2ZGV2LCBFcnJvciAqKmVycnApCkBAIC0x
ODcsNiArMzAzLDcgQEAgc3RhdGljIGludCB2ZmlvX2Rpc3BsYXlfZG1hYnVmX2luaXQoVkZJT1BD
SURldmljZSAqdmRldiwgRXJyb3IgKiplcnJwKQogICAgIGlmICh2ZGV2LT5lbmFibGVfcmFtZmIp
IHsKICAgICAgICAgdmRldi0+ZHB5LT5yYW1mYiA9IHJhbWZiX3NldHVwKGVycnApOwogICAgIH0K
KyAgICB2ZmlvX2Rpc3BsYXlfZWRpZF9pbml0KHZkZXYpOwogICAgIHJldHVybiAwOwogfQogCkBA
IC0zNjYsNSArNDgzLDYgQEAgdm9pZCB2ZmlvX2Rpc3BsYXlfZmluYWxpemUoVkZJT1BDSURldmlj
ZSAqdmRldikKICAgICBncmFwaGljX2NvbnNvbGVfY2xvc2UodmRldi0+ZHB5LT5jb24pOwogICAg
IHZmaW9fZGlzcGxheV9kbWFidWZfZXhpdCh2ZGV2LT5kcHkpOwogICAgIHZmaW9fZGlzcGxheV9y
ZWdpb25fZXhpdCh2ZGV2LT5kcHkpOworICAgIHZmaW9fZGlzcGxheV9lZGlkX2V4aXQodmRldi0+
ZHB5KTsKICAgICBnX2ZyZWUodmRldi0+ZHB5KTsKIH0KLS0gCjIuOS4zCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcg
bGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXYK
