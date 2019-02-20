Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp4642538ywa;
        Wed, 20 Feb 2019 09:08:29 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYv6e+96i26zw9aGH9GBh/xjjRScRVeMSeuPCL0/jy4+BU/JFwkPjT30qxkG8wccJlBepzI
X-Received: by 2002:a63:ae0e:: with SMTP id q14mr34440796pgf.151.1550682509255;
        Wed, 20 Feb 2019 09:08:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550682509; cv=none;
        d=google.com; s=arc-20160816;
        b=KzO4i7e12YuU82l6obBlI0yZbP5SfJY6TNP4VhIDECA4FG3RedGjNCWXiz4Dua61gt
         ttI4IAV9jXQZWKUsUmc2zNxCxPAWePP2/id5iTU/vn6M6sf5FK9wisBdhafN/zoi6nWC
         OfcXJlVSXZPjCQdDW+aN2XkLlY3ey8eP4lL0yjOyaWNlHdRqPS8vNhfMnCeVKJlBuFIg
         gYIXVIE8iPOb0a3duHsqTR06MPzexQqTNyo28U2OBL/EJ/vkRg77g8n9fygNCbvk2moX
         qIhVx+bqCUjyvi4/8qw7dNpS9tSsKm+jgNMMF0gMkWemwE2njL0It7nqW1Eh+B+ZaIUc
         bqHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:organization:references:in-reply-to
         :message-id:subject:to:from:date:delivered-to;
        bh=qYv2iRqp9LKDpVPTrCvGdjj7E4TEF/O/BEgPRY4H5Ss=;
        b=Sp1PgbHuLN5wYbw9m6qcC10NQxG1kZNvZXXv/yj/LORF972ZGNti2bYt9mPs/3k4pN
         adDKaqmfNz/YookJscuoGyiICJG1m4dvcHBu1fILpM+pDzNdl/StwbXpWFsK0LTf5g/R
         04O5tRnl4aO0NVLWQWByrMo5G3KMsr477hpPqgXiizp1rnSQo63hOa01eXGdgbTlpcvj
         mCs1X+htSvxVamnGG8Qs/QdmqB75qjRlS5/JW5OoK41hVdCQjwf8GyYiYNtWfgLDQSLS
         Od9QO9u82HtTQutiOQ9xLTImCIqQPElGt4WnSzzeQVmgjjOeQzjuKrbtrycjMLUc1zqM
         OsRg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id l6si19122683pgc.488.2019.02.20.09.08.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Feb 2019 09:08:28 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A11E89289;
	Wed, 20 Feb 2019 17:08:27 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F4BE89289
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 20 Feb 2019 17:08:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2EE11A0634;
 Wed, 20 Feb 2019 17:08:25 +0000 (UTC)
Received: from gondolin (dhcp-192-187.str.redhat.com [10.33.192.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A4E4860851;
 Wed, 20 Feb 2019 17:08:15 +0000 (UTC)
Date: Wed, 20 Feb 2019 18:08:13 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Zhao Yan <yan.y.zhao@intel.com>
Subject: Re: [PATCH 1/5] vfio/migration: define kernel interfaces
Message-ID: <20190220180813.17e6ab86.cohuck@redhat.com>
In-Reply-To: <20190220073636.GD16456@joy-OptiPlex-7040>
References: <1550566254-3545-1-git-send-email-yan.y.zhao@intel.com>
 <1550566334-3602-1-git-send-email-yan.y.zhao@intel.com>
 <20190219140918.476ac9d1.cohuck@redhat.com>
 <20190220073636.GD16456@joy-OptiPlex-7040>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Wed, 20 Feb 2019 17:08:25 +0000 (UTC)
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

T24gV2VkLCAyMCBGZWIgMjAxOSAwMjozNjozNiAtMDUwMApaaGFvIFlhbiA8eWFuLnkuemhhb0Bp
bnRlbC5jb20+IHdyb3RlOgoKPiBPbiBUdWUsIEZlYiAxOSwgMjAxOSBhdCAwMjowOToxOFBNICsw
MTAwLCBDb3JuZWxpYSBIdWNrIHdyb3RlOgo+ID4gT24gVHVlLCAxOSBGZWIgMjAxOSAxNjo1Mjox
NCArMDgwMAo+ID4gWWFuIFpoYW8gPHlhbi55LnpoYW9AaW50ZWwuY29tPiB3cm90ZToKKC4uLikK
PiA+ID4gKyAqICAgICAgICAgIFNpemUgb2YgZGV2aWNlIGNvbmZpZyBkYXRhIGlzIHNtYWxsZXIg
dGhhbiBvciBlcXVhbCB0byB0aGF0IG9mCj4gPiA+ICsgKiAgICAgICAgICBkZXZpY2UgY29uZmln
IHJlZ2lvbi4gIAo+ID4gCj4gPiBOb3Qgc3VyZSBpZiBJIHVuZGVyc3RhbmQgdGhhdCBzZW50ZW5j
ZSBjb3JyZWN0bHkuLi4gYnV0IHdoYXQgaWYgYQo+ID4gZGV2aWNlIGhhcyBtb3JlIGNvbmZpZyBz
dGF0ZSB0aGFuIGZpdHMgaW50byB0aGlzIHJlZ2lvbj8gSXMgdGhhdAo+ID4gc3VwcG9zZWQgdG8g
YmUgY292ZXJlZCBieSB0aGUgZGV2aWNlIG1lbW9yeSByZWdpb24/IE9yIGlzIHRoaXMgYXNzdW1l
ZAo+ID4gdG8gYmUgc29tZXRoaW5nIHNvIGV4b3RpYyB0aGF0IHdlIGRvbid0IG5lZWQgdG8gcGxh
biBmb3IgaXQ/Cj4gPiAgIAo+IERldmljZSBjb25maWcgZGF0YSBhbmQgZGV2aWNlIGNvbmZpZyBy
ZWdpb24gYXJlIGFsbCBwcm92aWRlZCBieSB2ZW5kb3IKPiBkcml2ZXIsIHNvIHZlbmRvciBkcml2
ZXIgaXMgYWx3YXlzIGFibGUgdG8gY3JlYXRlIGEgbGFyZ2UgZW5vdWdoIGRldmljZQo+IGNvbmZp
ZyByZWdpb24gdG8gaG9sZCBkZXZpY2UgY29uZmlnIGRhdGEuCj4gU28sIGlmIGEgZGV2aWNlIGhh
cyBkYXRhIHRoYXQgYXJlIGJldHRlciB0byBiZSBzYXZlZCBhZnRlciBkZXZpY2Ugc3RvcCBhbmQK
PiBzYXZlZC9sb2FkZWQgaW4gc3RyaWN0IG9yZGVyLCB0aGUgZGF0YSBuZWVkcyB0byBiZSBpbiBk
ZXZpY2UgY29uZmlnIHJlZ2lvbi4KPiBUaGlzIGtpbmQgb2YgZGF0YSBpcyBzdXBwb3NlZCB0byBi
ZSBzbWFsbC4KPiBJZiB0aGUgZGV2aWNlIGRhdGEgY2FuIGJlIHNhdmVkL2xvYWRlZCBzZXZlcmFs
IHRpbWVzLCBpdCBjYW4gYWxzbyBiZSBwdXQKPiBpbnRvIGRldmljZSBtZW1vcnkgcmVnaW9uLgoK
U28sIGl0IGlzIHRoZSB2ZW5kb3IgZHJpdmVyJ3MgZGVjaXNpb24gd2hpY2ggZGV2aWNlIGluZm9y
bWF0aW9uIHNob3VsZApnbyB2aWEgd2hpY2ggcmVnaW9uPyBXaXRoIHRoZSBkZXZpY2UgY29uZmln
IGRhdGEgc3VwcG9zZWQgdG8gYmUKc2F2ZWQvbG9hZGVkIGluIG9uZSBnbz8KCiguLi4pCj4gPiA+
ICsvKiB2ZXJzaW9uIG51bWJlciBvZiB0aGUgZGV2aWNlIHN0YXRlIGludGVyZmFjZSAqLwo+ID4g
PiArI2RlZmluZSBWRklPX0RFVklDRV9TVEFURV9JTlRFUkZBQ0VfVkVSU0lPTiAxICAKPiA+IAo+
ID4gSG0uIElzIHRoaXMgc3VwcG9zZWQgdG8gYmUgYmFja3dhcmRzLWNvbXBhdGlibGUsIHNob3Vs
ZCB3ZSBuZWVkIHRvIGJ1bXAKPiA+IHRoaXM/Cj4gPiAgCj4gY3VycmVudGx5IG5vIGJhY2t3b3Jk
cy1jb21wYXRpYmxlLiB3ZSBjYW4gZGlzY3VzcyBvbiB0aGF0LgoKSXQgbWlnaHQgYmUgdXNlZnVs
IGlmIHdlIGRpc2NvdmVyIHRoYXQgd2UgbmVlZCBzb21lIGV4dGVuc2lvbnMuIEJ1dCBJJ20Kbm90
IHN1cmUgaG93IG11Y2ggd29yayBpdCB3b3VsZCBiZS4KCiguLi4pCj4gPiA+ICsvKgo+ID4gPiAr
ICogREVWSUNFIFNUQVRFUwo+ID4gPiArICoKPiA+ID4gKyAqIEZvdXIgc3RhdGVzIGFyZSBkZWZp
bmVkIGZvciBhIFZGSU8gZGV2aWNlOgo+ID4gPiArICogUlVOTklORywgUlVOTklORyAmIExPR0dJ
TkcsIFNUT1AgJiBMT0dHSU5HLCBTVE9QLgo+ID4gPiArICogVGhleSBjYW4gYmUgc2V0IGJ5IHdy
aXRpbmcgdG8gZGV2aWNlX3N0YXRlIGZpZWxkIG9mCj4gPiA+ICsgKiB2ZmlvX2RldmljZV9zdGF0
ZV9jdGwgcmVnaW9uLiAgCj4gPiAKPiA+IFdobyBjb250cm9scyB0aGlzPyBVc2Vyc3BhY2U/ICAK
PiAKPiBZZXMuIFVzZXJzcGFjZSBub3RpZmllcyB2ZW5kb3IgZHJpdmVyIHRvIGRvIHRoZSBzdGF0
ZSBzd2l0Y2hpbmcuCgpNaWdodCBiZSBnb29kIHRvIG1lbnRpb24gdGhpcyAoanVzdCB0byBtYWtl
IGl0IG9idmlvdXMpLgoKPiA+ID4gKyAqIExPR0dJTkcgc3RhdGUgaXMgYSBzcGVjaWFsIHN0YXRl
IHRoYXQgaXQgQ0FOTk9UIGV4aXN0Cj4gPiA+ICsgKiBpbmRlcGVuZGVudGx5LiAgCj4gPiAKPiA+
IFNvIGl0J3Mgbm90IGEgc3RhdGUsIGJ1dCByYXRoZXIgYSBtb2RpZmllcj8KPiA+ICAgCj4geWVz
LiBvciB0aGlua2luZyBMT0dHSU5HL25vdCBMT0dHSU5HIGFzIGJpdCAxIG9mIGEgZGV2aWNlIHN0
YXRlLAo+IHdoZXJlYXMgUlVOTklORy9TVE9QUEVEIGlzIGJpdCAwIG9mIGEgZGV2aWNlIHN0YXRl
Lgo+IFRoZXkgaGF2ZSB0byBiZSBnb3QgYXMgYSB3aG9sZS4KClNvIGl0IGlzIChvbiBhIGJpdCBs
ZXZlbCk6ClJVTk5JTkcgLT4gMDAKU1RPUFBFRCAtPiAwMQpMT0dHSU5HL1JVTk5JTkcgLT4gMTAK
TE9HR0lORy9TVE9QUEVEIC0+IDExCiAKPiA+ID4gKyAqIEl0IG11c3QgYmUgc2V0IGFsb25nc2lk
ZSB3aXRoIHN0YXRlIFJVTk5JTkcgb3IgU1RPUCwgaS5lLAo+ID4gPiArICogUlVOTklORyAmIExP
R0dJTkcsIFNUT1AgJiBMT0dHSU5HLgo+ID4gPiArICogSXQgaXMgdXNlZCBmb3IgZGlydHkgZGF0
YSBsb2dnaW5nIGJvdGggZm9yIGRldmljZSBtZW1vcnkKPiA+ID4gKyAqIGFuZCBzeXN0ZW0gbWVt
b3J5Lgo+ID4gPiArICoKPiA+ID4gKyAqIExPR0dJTkcgb25seSBpbXBhY3RzIGRldmljZS9zeXN0
ZW0gbWVtb3J5LiBJbiBMT0dHSU5HIHN0YXRlLCBnZXQgYnVmZmVyCj4gPiA+ICsgKiBvZiBkZXZp
Y2UgbWVtb3J5IHJldHVybnMgZGlydHkgcGFnZXMgc2luY2UgbGFzdCBjYWxsOyBvdXRzaWRlIExP
R0dJTkcKPiA+ID4gKyAqIHN0YXRlLCBnZXQgYnVmZmVyIG9mIGRldmljZSBtZW1vcnkgcmV0dXJu
cyB3aG9sZSBzbmFwc2hvdCBvZiBkZXZpY2UKPiA+ID4gKyAqIG1lbW9yeS4gc3lzdGVtIG1lbW9y
eSdzIGRpcnR5IHBhZ2UgaXMgb25seSBhdmFpbGFibGUgaW4gTE9HR0lORyBzdGF0ZS4KPiA+ID4g
KyAqCj4gPiA+ICsgKiBEZXZpY2UgY29uZmlnIHNob3VsZCBiZSBhbHdheXMgYWNjZXNzaWJsZSBh
bmQgcmV0dXJuIHdob2xlIGNvbmZpZyBzbmFwc2hvdAo+ID4gPiArICogcmVnYXJkbGVzcyBvZiBM
T0dHSU5HIHN0YXRlLgo+ID4gPiArICogKi8KPiA+ID4gKyNkZWZpbmUgVkZJT19ERVZJQ0VfU1RB
VEVfUlVOTklORyAwCj4gPiA+ICsjZGVmaW5lIFZGSU9fREVWSUNFX1NUQVRFX1NUT1AgMQo+ID4g
PiArI2RlZmluZSBWRklPX0RFVklDRV9TVEFURV9MT0dHSU5HIDIKClRoaXMgbWFrZXMgaXQgbG9v
ayBhIGJpdCBsaWtlIExPR0dJTkcgd2VyZSBhbiBpbmRpdmlkdWFsIHN0YXRlLCB3aGlsZSAyCmlz
IGluIHJlYWxpdHkgTE9HR0lORy9SVU5OSU5HLi4uIG5vdCBzdXJlIGhvdyB0byBtYWtlIHRoYXQg
bW9yZQpvYnZpb3VzLiBNYXliZSAoYXMgd2UgYXJlIGRlYWxpbmcgd2l0aCBhIHUzMik6CgojZGVm
aW5lIFZGSU9fREVWSUNFX1NUQVRFX1JVTk5JTkcgMHgwMDAwMDAwMAojZGVmaW5lIFZGSU9fREVW
SUNFX1NUQVRFX1NUT1BQRUQgMHgwMDAwMDAwMQojZGVmaW5lIFZGSU9fREVWSUNFX1NUQVRFX0xP
R0dJTkdfUlVOTklORyAweDAwMDAwMDAyCiNkZWZpbmUgVkZJT19ERVZJQ0VfU1RBVEVfTE9HR0lO
R19TVE9QUEVEIDB4MDAwMDAwMDMKI2RlZmluZSBWRklPX0RFVklDRV9TVEFURV9MT0dHSU5HX01B
U0sgMHgwMDAwMDAwMgoKPiA+ID4gKwo+ID4gPiArLyogYWN0aW9uIHRvIGdldCBkYXRhIGZyb20g
ZGV2aWNlIG1lbW9yeSBvciBkZXZpY2UgY29uZmlnCj4gPiA+ICsgKiB0aGUgYWN0aW9uIGlzIHdy
aXRlIHRvIGRldmljZSBzdGF0ZSdzIGNvbnRyb2wgcmVnaW9uLCBhbmQgZGF0YSBpcyByZWFkCj4g
PiA+ICsgKiBmcm9tIGRldmljZSBtZW1vcnkgcmVnaW9uIG9yIGRldmljZSBjb25maWcgcmVnaW9u
Lgo+ID4gPiArICogRWFjaCB0aW1lIGJlZm9yZSByZWFkIGRldmljZSBtZW1vcnkgcmVnaW9uIG9y
IGRldmljZSBjb25maWcgcmVnaW9uLAo+ID4gPiArICogYWN0aW9uIFZGSU9fREVWSUNFX0RBVEFf
QUNUSU9OX0dFVF9CVUZGRVIgaXMgcmVxdWlyZWQgdG8gd3JpdGUgdG8gYWN0aW9uCj4gPiA+ICsg
KiBmaWVsZCBpbiBjb250cm9sIHJlZ2lvbi4gVGhhdCBpcyBiZWNhdXNlIGRldmljZSBtZW1vcnkg
YW5kIGRldmllIGNvbmZpZwo+ID4gPiArICogcmVnaW9uIGlzIG1tYXBlZCBpbnRvIHVzZXIgc3Bh
Y2UuIHZlbmRvciBkcml2ZXIgaGFzIHRvIGJlIG5vdGlmaWVkIG9mCj4gPiA+ICsgKiB0aGUgdGhl
IEdFVF9CVUZGRVIgYWN0aW9uIGluIGFkdmFuY2UuCj4gPiA+ICsgKi8KPiA+ID4gKyNkZWZpbmUg
VkZJT19ERVZJQ0VfREFUQV9BQ1RJT05fR0VUX0JVRkZFUiAxCj4gPiA+ICsKPiA+ID4gKy8qIGFj
dGlvbiB0byBzZXQgZGF0YSB0byBkZXZpY2UgbWVtb3J5IG9yIGRldmljZSBjb25maWcKPiA+ID4g
KyAqIHRoZSBhY3Rpb24gaXMgd3JpdGUgdG8gZGV2aWNlIHN0YXRlJ3MgY29udHJvbCByZWdpb24s
IGFuZCBkYXRhIGlzCj4gPiA+ICsgKiB3cml0dGVuIHRvIGRldmljZSBtZW1vcnkgcmVnaW9uIG9y
IGRldmljZSBjb25maWcgcmVnaW9uLgo+ID4gPiArICogRWFjaCB0aW1lIGFmdGVyIHdyaXRlIHRv
IGRldmljZSBtZW1vcnkgcmVnaW9uIG9yIGRldmljZSBjb25maWcgcmVnaW9uLAo+ID4gPiArICog
YWN0aW9uIFZGSU9fREVWSUNFX0RBVEFfQUNUSU9OX0dFVF9CVUZGRVIgaXMgcmVxdWlyZWQgdG8g
d3JpdGUgdG8gYWN0aW9uCj4gPiA+ICsgKiBmaWVsZCBpbiBjb250cm9sIHJlZ2lvbi4gVGhhdCBp
cyBiZWNhdXNlIGRldmljZSBtZW1vcnkgYW5kIGRldmllIGNvbmZpZwo+ID4gPiArICogcmVnaW9u
IGlzIG1tYXBlZCBpbnRvIHVzZXIgc3BhY2UuIHZlbmRvciBkcml2ZXIgaGFzIHRvIGJlIG5vdGlm
aWVkIG9mCj4gPiA+ICsgKiB0aGUgdGhlIFNFVF9CVUZGRVIgYWN0aW9uIGFmdGVyIGRhdGEgd3Jp
dHRlbi4KPiA+ID4gKyAqLwo+ID4gPiArI2RlZmluZSBWRklPX0RFVklDRV9EQVRBX0FDVElPTl9T
RVRfQlVGRkVSIDIgIAo+ID4gCj4gPiBMZXQgbWUgZGVzY3JpYmUgdGhpcyBpbiBteSBvd24gd29y
ZHMgdG8gbWFrZSBzdXJlIHRoYXQgSSB1bmRlcnN0YW5kCj4gPiB0aGlzIGNvcnJlY3RseS4KPiA+
IAo+ID4gLSBUaGUgYWN0aW9ucyBhcmUgc2V0IGJ5IHVzZXJzcGFjZSB0byBub3RpZnkgdGhlIGtl
cm5lbCB0aGF0IGl0IGlzCj4gPiAgIGdvaW5nIHRvIGdldCBkYXRhIG9yIHRoYXQgaXQgaGFzIGp1
c3Qgd3JpdHRlbiBkYXRhLgo+ID4gLSBUaGlzIGlzIG5lZWRlZCBhcyBhIG5vdGlmaWNhdGlvbiB0
aGF0IHRoZSBtbWFwcGVkIGRhdGEgc2hvdWxkIG5vdCBiZQo+ID4gICBjaGFuZ2VkIHJlc3AuIGp1
c3QgaGFzIGNoYW5nZWQuICAKPiB3ZSBuZWVkIHRoaXMgbm90aWZpY2F0aW9uIGlzIGJlY2F1c2Ug
d2hlbiB1c2Vyc3BhY2UgcmVhZCB0aGUgbW1hcHBlZCBkYXRhLAo+IGl0J3MgZnJvbSB0aGUgcHRy
IHJldHVybmVkIGZyb20gbW1hcCgpLiBTbywgd2hlbiB1c2Vyc3BhY2UgcmVhZHMgdGhhdCBwdHIs
Cj4gdGhlcmUgd2lsbCBiZSBubyBwYWdlIGZhdWx0IG9yIHJlYWQvd3JpdGUgc3lzdGVtIGNhbGxz
LCBzbyB2ZW5kb3IgZHJpdmVyCj4gZG9lcyBub3Qga25vdyB3aGV0aGVyIHJlYWQvd3JpdGUgb3Bl
cnRhdGlvbiBoYXBwZW5zIG9yIG5vdC4gCj4gVGhlcmVmb3JlLCBiZWZvcmUgdXNlcnNwYWNlIHJl
YWRzIHRoZSBwdHIgZnJvbSBtbWFwLCBpdCBmaXJzdCB3cml0ZXMgYWN0aW9uCj4gZmllbGQgaW4g
Y29udHJvbCByZWdpb24gKHRocm91Z2ggd3JpdGUgc3lzdGVtIGNhbGwpLCBhbmQgdmVuZG9yIGRy
aXZlcgo+IHdpbGwgbm90IHJldHVybiB0aGUgd3JpdGUgc3lzdGVtIGNhbGwgdW50aWwgZGF0YSBw
cmVwYXJlZC4KPiAKPiBXaGVuIHVzZXJzcGFjZSB3cml0ZXMgdG8gdGhhdCBwdHIgZnJvbSBtbWFw
LCBpdCB3cml0ZXMgZGF0YSB0byB0aGUgZGF0YQo+IHJlZ2lvbiBmaXJzdCwgdGhlbiB3cml0ZXMg
dGhlIGFjdGlvbiBmaWVsZCBpbiBjb250cm9sIHJlZ2lvbiAodGhyb3VnaCB3cml0ZQo+IHN5c3Rl
bSBjYWxsKSB0byBub3RpZnkgdmVuZG9yIGRyaXZlci4gdmVuZG9yIGRyaXZlciB3aWxsIHJldHVy
biB0aGUgc3lzdGVtCj4gY2FsbCBhZnRlciBpdCBjb3BpZXMgdGhlIGJ1ZmZlciBjb21wbGV0ZWx5
Lgo+ID4gCj4gPiBTbywgaG93IGRvZXMgdGhlIGtlcm5lbCBrbm93IHdoZXRoZXIgdGhlIHJlYWQg
YWN0aW9uIGhhcyBmaW5pc2hlZCByZXNwLgo+ID4gd2hldGhlciB0aGUgd3JpdGUgYWN0aW9uIGhh
cyBzdGFydGVkPyBFdmVuIGlmIHVzZXJzcGFjZSByZWFkcy93cml0ZXMgaXQKPiA+IGFzIGEgd2hv
bGUuCj4gPiAgIAo+IGtlcm5lbCBkb2VzIG5vdCB0b3VjaCB0aGUgZGF0YSByZWdpb24gZXhjZXB0
IHdoZW4gaW4gcmVzcG9uc2UgdG8gdGhlCj4gImFjdGlvbiIgd3JpdGUgc3lzdGVtIGNhbGwuCgpU
aGFua3MgZm9yIHRoZSBleHBsYW5hdGlvbiwgdGhhdCBtYWtlcyBzZW5zZS4KKC4uLikKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBt
YWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
