Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp141947ywe;
        Thu, 21 Feb 2019 02:56:59 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYVI1Qfh+6+WLw2I6Ogc4tCwbi4WLv+Ztd+7TpnExnXdXflkup4oa+iAkir9KOdmOzzl5w1
X-Received: by 2002:a65:628e:: with SMTP id f14mr33948157pgv.193.1550746619593;
        Thu, 21 Feb 2019 02:56:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550746619; cv=none;
        d=google.com; s=arc-20160816;
        b=PqoXf/9NCN6bLSD3RwYUkCoQ1dFnT+l+S+5RcJRJPgcF7ky5bPLYSQ0BRvA3+X5k4r
         w7d0PZUtzxgA58fAvdr73Y/sULdahmNy33Gfk8231aRvMMiFZrmXX843xgPYtUmcWZU2
         GzAtTcj4P/aDJkUwAUnoRTnqNaUbMOWcokbawvvwIEgzsJRv2bLK8b2NhDvU1GHN5uL+
         tSpdrSyUFLkDboATg14kBKM2gmDfPAzN2ermsrd+ZZfbiaPcXg5QrC6D+220jduq+h7F
         X2OgGa00jNDZ6w63Y/PZl3DBLAXmCJhJT2AjB8asmJwxYl/bqbXD8mvaiVlnjegnNISO
         Cg/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:organization:references:in-reply-to
         :message-id:subject:to:from:date:delivered-to;
        bh=8edXfz0kusz4BxF00UBCMxqXKsXOnBvL+UeFepjdpDE=;
        b=JK3wj2VSyvgSXSw94spJf4mpbJAhUGGiMrgKmTh3+t8hEBAWLIt+HGI7ohAkSUzRHn
         JMkKPkWEsr0N/dIcZ/xw6BoMvEbv8E+feRzJjYVhpV86PD7m/rKywLWHy7EBNUg/ym8V
         6NbZJLISrZ+q1OadjI9eakA6felD4F5zm59OfnO6xU3ODQfFkPOCXgZfFReF4lnQhAAQ
         J6CJxQFGXzympdoXgeAeCqP+KtTWYTwLnvzRexWcVsArUuQvn/kiQYHs970M8CTNRnbw
         fmHQtzitAi0A6g0A6vu91UXfs4LQcrHkLdlzGg5ybVi5qI0/XO6rPtDDhY6UWf43AU1q
         +ckw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id a73si2302870pge.5.2019.02.21.02.56.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Feb 2019 02:56:59 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE27C892CA;
	Thu, 21 Feb 2019 10:56:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF60892CA
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 21 Feb 2019 10:56:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D187D3082AFF;
 Thu, 21 Feb 2019 10:56:56 +0000 (UTC)
Received: from gondolin (dhcp-192-187.str.redhat.com [10.33.192.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F0605D9D4;
 Thu, 21 Feb 2019 10:56:49 +0000 (UTC)
Date: Thu, 21 Feb 2019 11:56:46 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Zhao Yan <yan.y.zhao@intel.com>
Subject: Re: [PATCH 2/5] vfio/migration: support device of device config
 capability
Message-ID: <20190221115646.416df963.cohuck@redhat.com>
In-Reply-To: <20190220225400.GF16456@joy-OptiPlex-7040>
References: <1550566254-3545-1-git-send-email-yan.y.zhao@intel.com>
 <1550566347-3648-1-git-send-email-yan.y.zhao@intel.com>
 <20190219153724.12460160.cohuck@redhat.com>
 <20190220225400.GF16456@joy-OptiPlex-7040>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Thu, 21 Feb 2019 10:56:57 +0000 (UTC)
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
Cc: cjia@nvidia.com, kvm@vger.kernel.org, aik@ozlabs.ru,
 Zhengxiao.zx@Alibaba-inc.com, shuangtai.tst@alibaba-inc.com,
 qemu-devel@nongnu.org, kwankhede@nvidia.com, eauger@redhat.com,
 yi.l.liu@intel.com, eskultet@redhat.com, ziye.yang@intel.com,
 mlevitsk@redhat.com, pasic@linux.ibm.com, arei.gonglei@huawei.com,
 felipe@nutanix.com, Ken.Xue@amd.com, kevin.tian@intel.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, intel-gvt-dev@lists.freedesktop.org,
 changpeng.liu@intel.com, zhi.a.wang@intel.com, jonathan.davies@nutanix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gV2VkLCAyMCBGZWIgMjAxOSAxNzo1NDowMCAtMDUwMApaaGFvIFlhbiA8eWFuLnkuemhhb0Bp
bnRlbC5jb20+IHdyb3RlOgoKPiBPbiBUdWUsIEZlYiAxOSwgMjAxOSBhdCAwMzozNzoyNFBNICsw
MTAwLCBDb3JuZWxpYSBIdWNrIHdyb3RlOgo+ID4gT24gVHVlLCAxOSBGZWIgMjAxOSAxNjo1Mjoy
NyArMDgwMAo+ID4gWWFuIFpoYW8gPHlhbi55LnpoYW9AaW50ZWwuY29tPiB3cm90ZToKPiA+ICAg
Cj4gPiA+IERldmljZSBjb25maWcgaXMgdGhlIGRlZmF1bHQgZGF0YSB0aGF0IGV2ZXJ5IGRldmlj
ZSBzaG91bGQgaGF2ZS4gc28KPiA+ID4gZGV2aWNlIGNvbmZpZyBjYXBhYmlsaXR5IGlzIGJ5IGRl
ZmF1bHQgb24sIG5vIG5lZWQgdG8gc2V0Lgo+ID4gPiAKPiA+ID4gLSBDdXJyZW50bHkgdHdvIHR5
cGUgb2YgcmVzb3VyY2VzIGFyZSBzYXZlZC9sb2FkZWQgZm9yIGRldmljZSBvZiBkZXZpY2UKPiA+
ID4gICBjb25maWcgY2FwYWJpbGl0eToKPiA+ID4gICBHZW5lcmFsIFBDSSBjb25maWcgZGF0YSwg
YW5kIERldmljZSBjb25maWcgZGF0YS4KPiA+ID4gICBUaGV5IGFyZSBjb3BpZXMgYXMgYSB3aG9s
ZSB3aGVuIHByZWNvcHkgaXMgc3RvcHBlZC4KPiA+ID4gCj4gPiA+IE1pZ3JhdGlvbiBzZXR1cCBm
bG93Ogo+ID4gPiAtIFNldHVwIGRldmljZSBzdGF0ZSByZWdpb25zLCBjaGVjayBpdHMgZGV2aWNl
IHN0YXRlIHZlcnNpb24gYW5kIGNhcGFiaWxpdGllcy4KPiA+ID4gICBNbWFwIERldmljZSBDb25m
aWcgUmVnaW9uIGFuZCBEaXJ0eSBCaXRtYXAgUmVnaW9uLCBpZiBhdmFpbGFibGUuCj4gPiA+IC0g
SWYgZGV2aWNlIHN0YXRlIHJlZ2lvbnMgYXJlIGZhaWxlZCB0byBnZXQgc2V0dXAsIGEgbWlncmF0
aW9uIGJsb2NrZXIgaXMKPiA+ID4gICByZWdpc3RlcmVkIGluc3RlYWQuCj4gPiA+IC0gQWRkZWQg
U2F2ZVZNSGFuZGxlcnMgdG8gcmVnaXN0ZXIgZGV2aWNlIHN0YXRlIHNhdmUvbG9hZCBoYW5kbGVy
cy4KPiA+ID4gLSBSZWdpc3RlciBWTSBzdGF0ZSBjaGFuZ2UgaGFuZGxlciB0byBzZXQgZGV2aWNl
J3MgcnVubmluZy9zdG9wIHN0YXRlcy4KPiA+ID4gLSBPbiBtaWdyYXRpb24gc3RhcnR1cCBvbiBz
b3VyY2UgbWFjaGluZSwgc2V0IGRldmljZSdzIHN0YXRlIHRvCj4gPiA+ICAgVkZJT19ERVZJQ0Vf
U1RBVEVfTE9HR0lORwo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogWWFuIFpoYW8gPHlhbi55
LnpoYW9AaW50ZWwuY29tPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBZdWxlaSBaaGFuZyA8eXVsZWku
emhhbmdAaW50ZWwuY29tPgo+ID4gPiAtLS0KPiA+ID4gIGh3L3ZmaW8vTWFrZWZpbGUub2JqcyAg
ICAgICAgIHwgICAyICstCj4gPiA+ICBody92ZmlvL21pZ3JhdGlvbi5jICAgICAgICAgICB8IDYz
MyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ID4gIGh3L3Zm
aW8vcGNpLmMgICAgICAgICAgICAgICAgIHwgICAxIC0KPiA+ID4gIGh3L3ZmaW8vcGNpLmggICAg
ICAgICAgICAgICAgIHwgIDI1ICstCj4gPiA+ICBpbmNsdWRlL2h3L3ZmaW8vdmZpby1jb21tb24u
aCB8ICAgMSArCj4gPiA+ICA1IGZpbGVzIGNoYW5nZWQsIDY1OSBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQo+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGh3L3ZmaW8vbWlncmF0aW9uLmMK
PiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9ody92ZmlvL01ha2VmaWxlLm9ianMgYi9ody92Zmlv
L01ha2VmaWxlLm9ianMKPiA+ID4gaW5kZXggOGIzZjY2NC4uZjMyZmYxOSAxMDA2NDQKPiA+ID4g
LS0tIGEvaHcvdmZpby9NYWtlZmlsZS5vYmpzCj4gPiA+ICsrKyBiL2h3L3ZmaW8vTWFrZWZpbGUu
b2Jqcwo+ID4gPiBAQCAtMSw2ICsxLDYgQEAKPiA+ID4gIGlmZXEgKCQoQ09ORklHX0xJTlVYKSwg
eSkKPiA+ID4gIG9iai0kKENPTkZJR19TT0ZUTU1VKSArPSBjb21tb24ubwo+ID4gPiAtb2JqLSQo
Q09ORklHX1BDSSkgKz0gcGNpLm8gcGNpLXF1aXJrcy5vIGRpc3BsYXkubwo+ID4gPiArb2JqLSQo
Q09ORklHX1BDSSkgKz0gcGNpLm8gcGNpLXF1aXJrcy5vIGRpc3BsYXkubyBtaWdyYXRpb24ubyAg
Cj4gPiAKPiA+IEkgdGhpbmsgeW91IHdhbnQgdG8gc3BsaXQgdGhlIG1pZ3JhdGlvbiBjb2RlOiBU
aGUgdHlwZS1pbmRlcGVuZGVudAo+ID4gY29kZSwgYW5kIHRoZSBwY2ktc3BlY2lmaWMgY29kZS4K
PiA+ICAKPiBvay4gYWN0dWFsbHksIG5vdyBvbmx5IHNhdmluZy9sb2FkaW5nIG9mIHBjaSBnZW5l
cmljIGNvbmZpZyBkYXRhIGlzCj4gcGNpLXNwZWNpZmljLiB0aGUgZGF0YSBnZXR0aW5nL3NldHRp
bmcgdGhyb3VnaCBkZXZpY2Ugc3RhdGUKPiBpbnRlcmZhY2VzIGFyZSB0eXBlLWluZGVwZW5kZW50
LgoKWWVzLiBJZiBpdCBoYXMgY2FwYWJpbGl0eSBjaGFpbnMsIGl0IGNhbiBwcm9iYWJseSBiZSBt
YWRlIHRvIHdvcmsuCgo+IAo+ID4gPiAgb2JqLSQoQ09ORklHX1ZGSU9fQ0NXKSArPSBjY3cubwo+
ID4gPiAgb2JqLSQoQ09ORklHX1NPRlRNTVUpICs9IHBsYXRmb3JtLm8KPiA+ID4gIG9iai0kKENP
TkZJR19WRklPX1hHTUFDKSArPSBjYWx4ZWRhLXhnbWFjLm8KKC4uLikKPiA+ID4gK3N0YXRpYyBp
bnQgdmZpb19zYXZlX2RhdGFfZGV2aWNlX2NvbmZpZyhWRklPUENJRGV2aWNlICp2ZGV2LCBRRU1V
RmlsZSAqZikKPiA+ID4gK3sKPiA+ID4gKyAgICBWRklPRGV2aWNlICp2YmFzZWRldiA9ICZ2ZGV2
LT52YmFzZWRldjsKPiA+ID4gKyAgICBWRklPUmVnaW9uICpyZWdpb25fY3RsID0KPiA+ID4gKyAg
ICAgICAgJnZkZXYtPm1pZ3JhdGlvbi0+cmVnaW9uW1ZGSU9fREVWU1RBVEVfUkVHSU9OX0NUTF07
Cj4gPiA+ICsgICAgVkZJT1JlZ2lvbiAqcmVnaW9uX2NvbmZpZyA9Cj4gPiA+ICsgICAgICAgICZ2
ZGV2LT5taWdyYXRpb24tPnJlZ2lvbltWRklPX0RFVlNUQVRFX1JFR0lPTl9EQVRBX0NPTkZJR107
Cj4gPiA+ICsgICAgdm9pZCAqZGVzdDsKPiA+ID4gKyAgICB1aW50MzJfdCBzejsKPiA+ID4gKyAg
ICB1aW50OF90ICpidWYgPSBOVUxMOwo+ID4gPiArICAgIHVpbnQzMl90IGFjdGlvbiA9IFZGSU9f
REVWSUNFX0RBVEFfQUNUSU9OX0dFVF9CVUZGRVI7Cj4gPiA+ICsgICAgdWludDY0X3QgbGVuID0g
dmRldi0+bWlncmF0aW9uLT5kZXZjb25maWdfc2l6ZTsKPiA+ID4gKwo+ID4gPiArICAgIHFlbXVf
cHV0X2JlNjQoZiwgbGVuKTsgIAo+ID4gCj4gPiBXaHkgYmlnIGVuZGlhbj8gKEdlbmVyYWxseSwg
ZG8gd2UgbmVlZCBhbnkgZW5kaWFubmVzcyBjb25zaWRlcmF0aW9ucz8pCj4gPiAgIAo+IEkgdGhp
bmsgYmlnIGVuZGlhbiBpcyB0aGUgZW5kaWFuIGZvciBxZW11IHRvIHNhdmUgZmlsZS4KPiBhcyBs
b25nIGFzIHFlbXVfcHV0IGFuZCBxZW11X2dldCB1c2UgdGhlIHNhbWUgZW5kaWFuLCBpdCB3aWxs
IGJlIG5vCj4gcHJvYmxlbS4KPiBkbyB5b3UgdGhpbmsgc28/CgpZZXMsIGFzIGxvbmcgd2UgYXJl
IGV4cGxpY2l0IGFib3V0IHRoZSBlbmRpYW5uZXNzLiBJJ20gbm90IHN1cmUgd2hldGhlcgplLmcu
IHBvd2VyIGV2ZW4gaGFzIHRoZSBhYmlsaXR5IHRvIG1peCBlbmRpYW5uZXNzLgoKKC4uLikKPiA+
ID4gK3N0YXRpYyBpbnQgdmZpb19zZXRfZGV2aWNlX3N0YXRlKFZGSU9QQ0lEZXZpY2UgKnZkZXYs
Cj4gPiA+ICsgICAgICAgIHVpbnQzMl90IGRldl9zdGF0ZSkKPiA+ID4gK3sKPiA+ID4gKyAgICBW
RklPRGV2aWNlICp2YmFzZWRldiA9ICZ2ZGV2LT52YmFzZWRldjsKPiA+ID4gKyAgICBWRklPUmVn
aW9uICpyZWdpb24gPQo+ID4gPiArICAgICAgICAmdmRldi0+bWlncmF0aW9uLT5yZWdpb25bVkZJ
T19ERVZTVEFURV9SRUdJT05fQ1RMXTsKPiA+ID4gKyAgICB1aW50MzJfdCBzeiA9IHNpemVvZihk
ZXZfc3RhdGUpOwo+ID4gPiArCj4gPiA+ICsgICAgaWYgKCF2ZGV2LT5taWdyYXRpb24pIHsKPiA+
ID4gKyAgICAgICAgcmV0dXJuIC0xOwo+ID4gPiArICAgIH0KPiA+ID4gKwo+ID4gPiArICAgIGlm
IChwd3JpdGUodmJhc2VkZXYtPmZkLCAmZGV2X3N0YXRlLCBzeiwKPiA+ID4gKyAgICAgICAgICAg
ICAgcmVnaW9uLT5mZF9vZmZzZXQgKwo+ID4gPiArICAgICAgICAgICAgICBvZmZzZXRvZihzdHJ1
Y3QgdmZpb19kZXZpY2Vfc3RhdGVfY3RsLCBkZXZpY2Vfc3RhdGUpKQo+ID4gPiArICAgICAgICAg
ICAgIT0gc3opIHsKPiA+ID4gKyAgICAgICAgZXJyb3JfcmVwb3J0KCJ2ZmlvOiBGYWlsZWQgdG8g
c2V0IGRldmljZSBzdGF0ZSAlZCIsIGRldl9zdGF0ZSk7ICAKPiA+IAo+ID4gQ2FuIHRoZSBrZXJu
ZWwgcmVqZWN0IHRoaXMgaWYgYSBzdGF0ZSB0cmFuc2l0aW9uIGlzIG5vdCBhbGxvd2VkIChvciBh
cmUKPiA+IGFsbCB0cmFuc2l0aW9ucyBhbGxvd2VkPykKPiA+ICAgCj4geWVzLCBrZXJuZWwgY2Fu
IHJlamVjdCBzb21lIHN0YXRlIHRyYW5zaXRpb24gaWYgaXQncyBub3QgYWxsb3dlZC4KPiBCdXQg
Y3VycmVudGx5IGFsbCB0cmFuc2l0aW9ucyBhcmUgYWxsb3dlZC4KPiBNYXliZSBhIGNoZWNrIG9m
IHNlbGYtdG8tc2VsZiB0cmFuc2l0aW9uIGlzIG5lZWRlZCBpbiBrZXJuZWwuCgpTZWxmLXRvLXNl
bGYgbG9va3MgYmVuaWduIGVub3VnaCB0byBzaW1wbHkgcmV0dXJuIHN1Y2Nlc3MgZWFybHkuCgo+
IAo+ID4gPiArICAgICAgICByZXR1cm4gLTE7Cj4gPiA+ICsgICAgfQo+ID4gPiArICAgIHZkZXYt
Pm1pZ3JhdGlvbi0+ZGV2aWNlX3N0YXRlID0gZGV2X3N0YXRlOwo+ID4gPiArICAgIHJldHVybiAw
Owo+ID4gPiArfQooLi4uKQo+ID4gPiArc3RhdGljIGludCB2ZmlvX2NoZWNrX2RldnN0YXRlX3Zl
cnNpb24oVkZJT1BDSURldmljZSAqdmRldikKPiA+ID4gK3sKPiA+ID4gKyAgICBWRklPRGV2aWNl
ICp2YmFzZWRldiA9ICZ2ZGV2LT52YmFzZWRldjsKPiA+ID4gKyAgICBWRklPUmVnaW9uICpyZWdp
b24gPQo+ID4gPiArICAgICAgICAmdmRldi0+bWlncmF0aW9uLT5yZWdpb25bVkZJT19ERVZTVEFU
RV9SRUdJT05fQ1RMXTsKPiA+ID4gKwo+ID4gPiArICAgIHVpbnQzMl90IHZlcnNpb247Cj4gPiA+
ICsgICAgdWludDMyX3Qgc2l6ZSA9IHNpemVvZih2ZXJzaW9uKTsKPiA+ID4gKwo+ID4gPiArICAg
IGlmIChwcmVhZCh2YmFzZWRldi0+ZmQsICZ2ZXJzaW9uLCBzaXplLAo+ID4gPiArICAgICAgICAg
ICAgICAgIHJlZ2lvbi0+ZmRfb2Zmc2V0ICsKPiA+ID4gKyAgICAgICAgICAgICAgICBvZmZzZXRv
ZihzdHJ1Y3QgdmZpb19kZXZpY2Vfc3RhdGVfY3RsLCB2ZXJzaW9uKSkKPiA+ID4gKyAgICAgICAg
ICAgICE9IHNpemUpIHsKPiA+ID4gKyAgICAgICAgZXJyb3JfcmVwb3J0KCIlcyBGYWlsZWQgdG8g
cmVhZCB2ZXJzaW9uIG9mIGRldmljZSBzdGF0ZSBpbnRlcmZhY2VzIiwKPiA+ID4gKyAgICAgICAg
ICAgICAgICB2YmFzZWRldi0+bmFtZSk7Cj4gPiA+ICsgICAgICAgIHJldHVybiAtMTsKPiA+ID4g
KyAgICB9Cj4gPiA+ICsKPiA+ID4gKyAgICBpZiAodmVyc2lvbiAhPSBWRklPX0RFVklDRV9TVEFU
RV9JTlRFUkZBQ0VfVkVSU0lPTikgewo+ID4gPiArICAgICAgICBlcnJvcl9yZXBvcnQoIiVzIG1p
Z3JhdGlvbiB2ZXJzaW9uIG1pc21hdGNoLCByaWdodCB2ZXJzaW9uIGlzICVkIiwKPiA+ID4gKyAg
ICAgICAgICAgICAgICB2YmFzZWRldi0+bmFtZSwgVkZJT19ERVZJQ0VfU1RBVEVfSU5URVJGQUNF
X1ZFUlNJT04pOyAgCj4gPiAKPiA+IFNvLCB3ZSByZXF1aXJlIGFuIGV4YWN0IG1hdGNoLi4uIG9y
IHNob3VsZCB3ZSBhbGxvdyB0byBleHRlbmQgdGhlCj4gPiBpbnRlcmZhY2UgaW4gYW4gYmFja3dh
cmRzLWNvbXBhdGlibGUgd2F5LCBpbiB3aGljaCBjYXNlIHdlJ2QgcmVxdWlyZQo+ID4gKFFFTVUg
aW50ZXJmYWNlIHZlcnNpb24pIDw9IChrZXJuZWwgaW50ZXJmYWNlIHZlcnNpb24pPwo+ID4gIAo+
IGN1cnJlbnRseSB5ZXMuIHdlIGNhbiBkaXNjdXNzIG9uIHRoYXQuCgpJZiB3ZSB3YW50IHRvIGFs
bG93IHRoYXQsIHdlIG5lZWQgdG8gaGF2ZSBhIHN0cmljdGx5IG1vbm90b25vdXMKcHJvZ3Jlc3Np
b24gb2YgdmVyc2lvbnMgaGVyZSAod2hpY2ggbWVhbnMgZHJhZ2dpbmcgYWxvbmcgb2xkCmNvbXBh
dGliaWxpdHkgY29kZSBmb3IgYmFzaWNhbGx5IGZvcmV2ZXIpLiBNYWludGFpbmluZyBhIHRhYmxl
IGFib3V0CndoaWNoIHZlcnNpb24gaXMgY29tcGF0aWJsZSB3aXRoIHdoaWNoIG90aGVyIHZlcnNp
b24gd291bGQgZ2V0IGluc2FuZQpwcmV0dHkgcXVpY2tseS4KCkNhbiB3ZSBzb21laG93IGFjY29t
bW9kYXRlIG1vcmUgb3B0aW9uYWwgcmVnaW9ucyB2aWEgY2FwYWJpbGl0aWVzPwpNYXliZSB2aWEg
b3B0aW9uYWwgdm1zdGF0ZXM/Cgo+ID4gPiArICAgICAgICByZXR1cm4gLTE7Cj4gPiA+ICsgICAg
fQo+ID4gPiArCj4gPiA+ICsgICAgcmV0dXJuIDA7Cj4gPiA+ICt9CiguLi4pCj4gPiA+ICtzdGF0
aWMgdm9pZCB2ZmlvX3BjaV9sb2FkX2NvbmZpZyhWRklPUENJRGV2aWNlICp2ZGV2LCBRRU1VRmls
ZSAqZikKPiA+ID4gK3sKPiA+ID4gKyAgICBQQ0lEZXZpY2UgKnBkZXYgPSAmdmRldi0+cGRldjsK
PiA+ID4gKyAgICB1aW50MzJfdCBjdGwsIG1zaV9sbywgbXNpX2hpLCBtc2lfZGF0YSwgYmFyX2Nm
ZywgaTsKPiA+ID4gKyAgICBib29sIG1zaV82NGJpdDsKPiA+ID4gKwo+ID4gPiArICAgIC8qIHJl
dG9yZSBwY2kgYmFyIGNvbmZpZ3VyYXRpb24gKi8KPiA+ID4gKyAgICBjdGwgPSBwY2lfZGVmYXVs
dF9yZWFkX2NvbmZpZyhwZGV2LCBQQ0lfQ09NTUFORCwgMik7Cj4gPiA+ICsgICAgdmZpb19wY2lf
d3JpdGVfY29uZmlnKHBkZXYsIFBDSV9DT01NQU5ELAo+ID4gPiArICAgICAgICAgICAgY3RsICYg
KCEoUENJX0NPTU1BTkRfSU8gfCBQQ0lfQ09NTUFORF9NRU1PUlkpKSwgMik7Cj4gPiA+ICsgICAg
Zm9yIChpID0gMDsgaSA8IFBDSV9ST01fU0xPVDsgaSsrKSB7Cj4gPiA+ICsgICAgICAgIGJhcl9j
ZmcgPSBxZW11X2dldF9iZTMyKGYpOwo+ID4gPiArICAgICAgICB2ZmlvX3BjaV93cml0ZV9jb25m
aWcocGRldiwgUENJX0JBU0VfQUREUkVTU18wICsgaSAqIDQsIGJhcl9jZmcsIDQpOwo+ID4gPiAr
ICAgIH0KPiA+ID4gKyAgICB2ZmlvX3BjaV93cml0ZV9jb25maWcocGRldiwgUENJX0NPTU1BTkQs
Cj4gPiA+ICsgICAgICAgICAgICBjdGwgfCBQQ0lfQ09NTUFORF9JTyB8IFBDSV9DT01NQU5EX01F
TU9SWSwgMik7Cj4gPiA+ICsKPiA+ID4gKyAgICAvKiByZXN0b3JlIG1zaSBjb25maWd1cmF0aW9u
ICovCj4gPiA+ICsgICAgY3RsID0gcGNpX2RlZmF1bHRfcmVhZF9jb25maWcocGRldiwgcGRldi0+
bXNpX2NhcCArIFBDSV9NU0lfRkxBR1MsIDIpOwo+ID4gPiArICAgIG1zaV82NGJpdCA9ICEhKGN0
bCAmIFBDSV9NU0lfRkxBR1NfNjRCSVQpOwo+ID4gPiArCj4gPiA+ICsgICAgdmZpb19wY2lfd3Jp
dGVfY29uZmlnKCZ2ZGV2LT5wZGV2LAo+ID4gPiArICAgICAgICAgICAgcGRldi0+bXNpX2NhcCAr
IFBDSV9NU0lfRkxBR1MsCj4gPiA+ICsgICAgICAgICAgICBjdGwgJiAoIVBDSV9NU0lfRkxBR1Nf
RU5BQkxFKSwgMik7Cj4gPiA+ICsKPiA+ID4gKyAgICBtc2lfbG8gPSBxZW11X2dldF9iZTMyKGYp
Owo+ID4gPiArICAgIHZmaW9fcGNpX3dyaXRlX2NvbmZpZyhwZGV2LCBwZGV2LT5tc2lfY2FwICsg
UENJX01TSV9BRERSRVNTX0xPLCBtc2lfbG8sIDQpOwo+ID4gPiArCj4gPiA+ICsgICAgaWYgKG1z
aV82NGJpdCkgewo+ID4gPiArICAgICAgICBtc2lfaGkgPSBxZW11X2dldF9iZTMyKGYpOwo+ID4g
PiArICAgICAgICB2ZmlvX3BjaV93cml0ZV9jb25maWcocGRldiwgcGRldi0+bXNpX2NhcCArIFBD
SV9NU0lfQUREUkVTU19ISSwKPiA+ID4gKyAgICAgICAgICAgICAgICBtc2lfaGksIDQpOwo+ID4g
PiArICAgIH0KPiA+ID4gKyAgICBtc2lfZGF0YSA9IHFlbXVfZ2V0X2JlMzIoZik7Cj4gPiA+ICsg
ICAgdmZpb19wY2lfd3JpdGVfY29uZmlnKHBkZXYsCj4gPiA+ICsgICAgICAgICAgICBwZGV2LT5t
c2lfY2FwICsgKG1zaV82NGJpdCA/IFBDSV9NU0lfREFUQV82NCA6IFBDSV9NU0lfREFUQV8zMiks
Cj4gPiA+ICsgICAgICAgICAgICBtc2lfZGF0YSwgMik7Cj4gPiA+ICsKPiA+ID4gKyAgICB2Zmlv
X3BjaV93cml0ZV9jb25maWcoJnZkZXYtPnBkZXYsIHBkZXYtPm1zaV9jYXAgKyBQQ0lfTVNJX0ZM
QUdTLAo+ID4gPiArICAgICAgICAgICAgY3RsIHwgUENJX01TSV9GTEFHU19FTkFCTEUsIDIpOwo+
ID4gPiArICAKPiA+IAo+ID4gT2ssIHRoaXMgZnVuY3Rpb24gaXMgaW5kZWVkIHBjaS1zcGVjaWZp
YyBhbmQgcHJvYmFibHkgc2hvdWxkIGJlIG1vdmVkCj4gPiB0byB0aGUgdmZpby1wY2kgY29kZSAo
b3RoZXIgdHlwZXMgY291bGQgaG9vayB0aGVtc2VsdmVzIHVwIGluIHRoZSBzYW1lCj4gPiBwbGFj
ZSwgdGhlbikuCj4gPiAgIAo+IHllcywgdGhpcyBpcyB0aGUgb25seSBwY2ktc3BlY2lmaWMgY29k
ZS4KPiBtYXliZSB1c2luZyBWRklPX0RFVklDRV9UWVBFX1BDSSBhcyBhIHNpZ24gdG8gZGVjaWRl
IHdoZXRoZXIgdG8gc2F2ZS9sb2FkCj4gcGNpIGNvbmZpZyBkYXRhPwo+IG9yIGFzIERhdmUgc2Fp
ZCwgcHV0IHNhdmluZy9sb2FkaW5nIG9mIHBjaSBjb25maWcgZGF0YSBpbnRvCj4gVk1TdGF0ZURl
c2NyaXB0aW9uIGludGVyZmFjZT8KCkkgbGlrZSBoYXZpbmcgYW4gaW50ZXJmYWNlIGxpa2Ugdm1z
dGF0ZSB3aGVyZSBvdGhlciB0eXBlcyBjYW4gcmVnaXN0ZXIKdGhlbXNlbHZlcyBiZXR0ZXIgdGhh
biBpbnRyb2R1Y2luZyBjb25kaXRpb25hbCBoYW5kbGluZyBiYXNlZCBvbgpoYXJkLWNvZGVkIHR5
cGUgdmFsdWVzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lu
dGVsLWd2dC1kZXY=
