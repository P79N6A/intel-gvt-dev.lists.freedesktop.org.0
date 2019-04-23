Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp3524318ywo;
        Tue, 23 Apr 2019 07:57:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwd+NPlpeMpkCNswvwamzoufW3SZ0xil+9Ud/oji+flnyuzW140NbyVHwHvl3yKp9pcxh1B
X-Received: by 2002:a63:6fcd:: with SMTP id k196mr24852500pgc.238.1556031452425;
        Tue, 23 Apr 2019 07:57:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556031452; cv=none;
        d=google.com; s=arc-20160816;
        b=Huh82ytZgUJQKiYrWY2+KM4IHOe0PabcNQipf5GJ4ZaIyjPUaDAz6bZv20oS+slaRs
         6c/9v6iJdbZSt12CDIg9sriKErsvIgfnFvqp0cgphdevnTpubiaTsGS3Wd+2mNoEiAeN
         ro3HoUrnfUGIJA4qoxQEMKXrVRT0DkenVeuComZSaPDzavMzs63Gmq5Z3tgrdxhN/LGX
         tDY8d34B1eCV+q+s3dWzteeL4hOcMIywJrcYgPl7Lc60w9tpAvcKJpPFS6T2yhG1kTtY
         ODyV4RQZcMmpzTz9ddN4HnDV+IP/QXG808H8JQP9W/TGgns4l/lps4Ixlh90vaAp+5pO
         Td4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:reply-to
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=MzCpblTnyXrLWEgHY4fcv2GcDn3uqtbS/eQG5wLMeT8=;
        b=tIrkCfu/4HesT4/GeMV36JKDi1ELFz7oIl25xk1ZW3pubQJF5jHd6yVzXbc5MOWo9g
         kC1B5RXmO4GoKS9sRRTQPf8UA1WJ3vlmPisYFVyv1GjnAszkP09rw5K2K/h+YqUhax/o
         5UMRnN0r2Un+xjGvu4ZVtWMXs760nqkVdbjhV9g9PpZvXKlJMv2Gxb3X0W8CiSCZ3F+d
         Nf4XEN8qnBjt/8lJulOVC9fE0QTp1UrG9sHr1Id68JKh53BamMX/lCG4GqrxBg9Qabwd
         NU3ZdsIaBY29QuLpOsli2yXzxuC0czW3DcXk2iZZgAbODOnQkWgg3yjiKFy7+4ZBtyXf
         JEFg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id c25si17095207pfr.94.2019.04.23.07.57.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Apr 2019 07:57:32 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E677D893A2;
	Tue, 23 Apr 2019 14:57:31 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 174B0893A2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 23 Apr 2019 14:57:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D344F30BC665;
 Tue, 23 Apr 2019 14:57:29 +0000 (UTC)
Received: from redhat.com (ovpn-112-50.ams2.redhat.com [10.36.112.50])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 130C361B77;
 Tue, 23 Apr 2019 14:57:11 +0000 (UTC)
Date: Tue, 23 Apr 2019 15:57:08 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 1/2] vfio/mdev: add version field as
 mandatory attribute for mdev device
Message-ID: <20190423145708.GP6022@redhat.com>
References: <20190419083258.19580-1-yan.y.zhao@intel.com>
 <20190419083505.19654-1-yan.y.zhao@intel.com>
 <20190423103939.GF6022@redhat.com>
 <20190423063540.7ec83c31@x1.home>
 <20190423134400.GL6022@redhat.com>
 <20190423084852.62168bb2@x1.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190423084852.62168bb2@x1.home>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Tue, 23 Apr 2019 14:57:30 +0000 (UTC)
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: cjia@nvidia.com, kvm@vger.kernel.org, aik@ozlabs.ru,
 Zhengxiao.zx@alibaba-inc.com, shuangtai.tst@alibaba-inc.com,
 qemu-devel@nongnu.org, kwankhede@nvidia.com, eauger@redhat.com,
 yi.l.liu@intel.com, eskultet@redhat.com, ziye.yang@intel.com,
 mlevitsk@redhat.com, pasic@linux.ibm.com, libvir-list@redhat.com,
 arei.gonglei@huawei.com, felipe@nutanix.com, Ken.Xue@amd.com,
 kevin.tian@intel.com, Yan Zhao <yan.y.zhao@intel.com>, dgilbert@redhat.com,
 zhenyuw@linux.intel.com, intel-gvt-dev@lists.freedesktop.org,
 changpeng.liu@intel.com, cohuck@redhat.com, linux-kernel@vger.kernel.org,
 zhi.a.wang@intel.com, jonathan.davies@nutanix.com, shaopeng.he@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVHVlLCBBcHIgMjMsIDIwMTkgYXQgMDg6NDg6NTJBTSAtMDYwMCwgQWxleCBXaWxsaWFtc29u
IHdyb3RlOgo+IE9uIFR1ZSwgMjMgQXByIDIwMTkgMTQ6NDQ6MDAgKzAxMDAKPiBEYW5pZWwgUC4g
QmVycmFuZ8OpIDxiZXJyYW5nZUByZWRoYXQuY29tPiB3cm90ZToKPiAKPiA+IE9uIFR1ZSwgQXBy
IDIzLCAyMDE5IGF0IDA2OjM1OjQwQU0gLTA2MDAsIEFsZXggV2lsbGlhbXNvbiB3cm90ZToKPiA+
ID4gT24gVHVlLCAyMyBBcHIgMjAxOSAxMTozOTozOSArMDEwMAo+ID4gPiBEYW5pZWwgUC4gQmVy
cmFuZ8OpIDxiZXJyYW5nZUByZWRoYXQuY29tPiB3cm90ZToKPiA+ID4gICAKPiA+ID4gPiBPbiBG
cmksIEFwciAxOSwgMjAxOSBhdCAwNDozNTowNEFNIC0wNDAwLCBZYW4gWmhhbyB3cm90ZTogIAo+
ID4gPiA+ID4gKyogdmVyc2lvbgo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgVGhpcyBhdHRyaWJ1
dGUgaXMgcncuIEl0IGlzIHVzZWQgdG8gY2hlY2sgd2hldGhlciB0d28gZGV2aWNlcyBhcmUgY29t
cGF0aWJsZQo+ID4gPiA+ID4gKyAgZm9yIGxpdmUgbWlncmF0aW9uLiBJZiB0aGlzIGF0dHJpYnV0
ZSBpcyBtaXNzaW5nLCB0aGVuIHRoZSBjb3JyZXNwb25kaW5nIG1kZXYKPiA+ID4gPiA+ICsgIGRl
dmljZSBpcyByZWdhcmRlZCBhcyBub3Qgc3VwcG9ydGluZyBsaXZlIG1pZ3JhdGlvbi4KPiA+ID4g
PiA+ICsKPiA+ID4gPiA+ICsgIEl0IGNvbnNpc3RzIG9mIHR3byBwYXJ0czogY29tbW9uIHBhcnQg
YW5kIHZlbmRvciBwcm9wcmlldGFyeSBwYXJ0Lgo+ID4gPiA+ID4gKyAgY29tbW9uIHBhcnQ6IDMy
IGJpdC4gbG93ZXIgMTYgYml0cyBpcyB2ZW5kb3IgaWQgYW5kIGhpZ2hlciAxNiBiaXRzIGlkZW50
aWZpZXMKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBkZXZpY2UgdHlwZS4gZS5nLiwgZm9yIHBj
aSBkZXZpY2UsIGl0IGlzCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgInBjaSB2ZW5kb3IgaWQi
IHwgKFZGSU9fREVWSUNFX0ZMQUdTX1BDSSA8PCAxNikuCj4gPiA+ID4gPiArICB2ZW5kb3IgcHJv
cHJpZXRhcnkgcGFydDogdGhpcyBwYXJ0IGlzIHZhcmllZCBpbiBsZW5ndGguIHZlbmRvciBkcml2
ZXIgY2FuCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgc3BlY2lmeSBhbnkgc3RyaW5nIHRvIGlk
ZW50aWZ5IGEgZGV2aWNlLgo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgV2hlbiByZWFkaW5nIHRo
aXMgYXR0cmlidXRlLCBpdCBzaG91bGQgc2hvdyBkZXZpY2UgdmVyc2lvbiBzdHJpbmcgb2YgdGhl
IGRldmljZQo+ID4gPiA+ID4gKyAgb2YgdHlwZSA8dHlwZS1pZD4uIElmIGEgZGV2aWNlIGRvZXMg
bm90IHN1cHBvcnQgbGl2ZSBtaWdyYXRpb24sIGl0IHNob3VsZAo+ID4gPiA+ID4gKyAgcmV0dXJu
IGVycm5vLgo+ID4gPiA+ID4gKyAgV2hlbiB3cml0aW5nIGEgc3RyaW5nIHRvIHRoaXMgYXR0cmli
dXRlLCBpdCByZXR1cm5zIGVycm5vIGZvciBpbmNvbXBhdGliaWxpdHkKPiA+ID4gPiA+ICsgIG9y
IHJldHVybnMgd3JpdHRlbiBzdHJpbmcgbGVuZ3RoIGluIGNvbXBhdGliaWxpdHkgY2FzZS4gSWYg
YSBkZXZpY2UgZG9lcyBub3QKPiA+ID4gPiA+ICsgIHN1cHBvcnQgbGl2ZSBtaWdyYXRpb24sIGl0
IGFsd2F5cyByZXR1cm5zIGVycm5vLgo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgZm9yIGV4YW1w
bGUuCj4gPiA+ID4gPiArICAjIGNhdCBcCj4gPiA+ID4gPiArIC9zeXMvYnVzL3BjaS9kZXZpY2Vz
LzAwMDBcOjAwXDowMi4wL21kZXZfc3VwcG9ydGVkX3R5cGVzL2k5MTUtR1ZUZ19WNV8yL3ZlcnNp
b24KPiA+ID4gPiA+ICsgIDAwMDI4MDg2LTE5M2ItaTkxNS1HVlRnX1Y1XzIKPiA+ID4gPiA+ICsK
PiA+ID4gPiA+ICsgICNlY2hvIDAwMDI4MDg2LTE5M2ItaTkxNS1HVlRnX1Y1XzIgPiBcCj4gPiA+
ID4gPiArIC9zeXMvYnVzL3BjaS9kZXZpY2VzLzAwMDBcOjAwXDowMi4wL21kZXZfc3VwcG9ydGVk
X3R5cGVzL2k5MTUtR1ZUZ19WNV80L3ZlcnNpb24KPiA+ID4gPiA+ICsgLWJhc2g6IGVjaG86IHdy
aXRlIGVycm9yOiBJbnZhbGlkIGFyZ3VtZW50Cj4gPiA+ID4gPiArICAgIAo+ID4gPiA+IAo+ID4g
PiA+IElJVUMgdGhpcyBwYXRoIGlzIGFnYWluc3QgdGhlIHBoeXNpY2FsIGRldmljZS4gSU9XLCB0
aGUgbWdtdCBhcHAgd291bGQgaGF2ZQo+ID4gPiA+IHRvIGZpcnN0IHdyaXRlIHRvIHRoZSAidmVy
c2lvbiIgZmlsZSB0byBjaG9vc2UgYSB2ZXJzaW9uLCBhbmQgdGhlbiB3cml0ZSB0bwo+ID4gPiA+
IHRoZSAiY3JlYXRlIiBmaWxlIHRvIGFjdHVhbGx5IGNyZWF0ZSBhbiB2aXJ0dWFsIGRldmljZS4g
VGhpcyBoYXMgdGhlIG9idmlvdXMKPiA+ID4gPiBjb25jdXJyZW5jeSBwcm9ibGVtIGlmIG11bHRp
cGxlIGRldmljZXMgYXJlIGJlaW5nIGNyZWF0ZWQgYXQgdGhlIHNhbWUgdGltZQo+ID4gPiA+IGFu
ZCBkaXN0aW5jdCB2ZXJzaW9ucyBmb3IgZWFjaCBkZXZpY2UgYXJlIHJlcXVpcmVkLiBUaGVyZSB3
b3VsZCBuZWVkIHRvIGJlCj4gPiA+ID4gYSBsb2NraW5nIHNjaGVtZSBkZWZpbmVkIHRvIGVuc3Vy
ZSBzYWZldHkuICAKPiA+ID4gCj4gPiA+ICJDcmVhdGUgYSBkZXZpY2Ugb2YgYSBnaXZlbiB2ZXJz
aW9uIiBpcyBub3QgYW4gaW50ZW5kZWQgZmVhdHVyZSBvZiB0aGlzCj4gPiA+IGludGVyZmFjZSBh
aXVpLiAgV3JpdGluZyB0aGUgdmVyc2lvbiBhdHRyaWJ1dGUgb25seSBpbmRpY2F0ZXMKPiA+ID4g
bWlncmF0aW9uIGNvbXBhdGliaWxpdHkgd2l0aCBhIGJpbmFyeSByZXN1bHQuCj4gPiA+ICAgIAo+
ID4gPiA+IFdvdWxkbid0IGl0IGJlIGJldHRlciBpZiB3ZSBjYW4gcGFzcyB0aGUgZGVzaXJlZCB2
ZXJzaW9uIHdoZW4gd2Ugd3JpdGUgdG8KPiA+ID4gPiB0aGUgImNyZWF0ZSIgZmlsZSwgc28gdGhh
dCB3ZSBhdm9pZCBhbnkgY29uY3VycmVudCB1c2FnZSBwcm9ibGVtcy4gInZlcnNpb24iCj4gPiA+
ID4gY291bGQgYmUganVzdCBhIHJlYWQtb25seSBmaWxlIHdpdGggYSAqbGlzdCogb2Ygc3VwcG9y
dGVkIHZlcnNpb25zLgo+ID4gPiA+IAo+ID4gPiA+IGVnCj4gPiA+ID4gCj4gPiA+ID4gICAkIGNh
dCAvc3lzL2J1cy9wY2kvZGV2aWNlcy8wMDAwXDowMFw6MDIuMC9tZGV2X3N1cHBvcnRlZF90eXBl
cy9pOTE1LUdWVGdfVjVfNC92ZXJzaW9uCj4gPiA+ID4gICA1LjAKPiA+ID4gPiAgIDUuMQo+ID4g
PiA+ICAgNS4yCj4gPiA+ID4gCj4gPiA+ID4gICAkIGVjaG8gIjgzYjhmNGYyLTUwOWYtMzgyZi0z
YzFlLWU2YmZlMGZhMTAwMTt2ZXJzaW9uPTUuMiIgPgo+ID4gPiA+ICAgICAgIC9zeXMvZGV2aWNl
cy92aXJ0dWFsL210dHkvbXR0eS9tZGV2X3N1cHBvcnRlZF90eXBlcy9tdHR5LTIvY3JlYXRlICAK
PiA+ID4gCj4gPiA+IFRoaXMgaXMgcmVtaW5pc2NlbnQgb2YgdGhlIHByb3Bvc2VkIGFnZ3JlZ2F0
aW9uIHN1cHBvcnQsIGJ1dCBhZ2FpbiwKPiA+ID4gdGhpcyBzb3J0IG9mIGZlYXR1cmUgaXMgbm90
IGludGVuZGVkIGhlcmUuICBJdCdzIG5vIGV4cGVjdGVkIHRoYXQgYW55Cj4gPiA+IHZlbmRvciBk
cml2ZXIgd291bGQgc3VwcG9ydCBjcmVhdGluZyBkZXZpY2UgdHlwZXMgb2YgZGlmZmVyZW50Cj4g
PiA+IHZlcnNpb25zLCBidXQgdGhleSBtYXkgc3VwcG9ydCBtaWdyYXRpb24gZnJvbSBkaWZmZXJl
bnQgdmVyc2lvbnMuICAKPiA+IAo+ID4gSG1tLCB0aGF0J3MgYSBzdWJ0bGUgZGlzdGluY3Rpb24g
SSB3YXNuJ3Qgc2VlaW5nIHRoZSBwYXRjaCBzZXJpZXMuCj4gPiBJSVVDIGZyb20gd2hhdCB5b3Un
cmUgc2F5aW5nLCBhIGRldmljZSBjYW4gYmUgY3JlYXRlZCB3aXRoIHZlcnNpb24KPiA+ICJDIiwg
YnV0IGZvciBhbiBpbmNvbWluZyBtaWdyYXRpb24gaXQgY2FuIChwb3RlbnRpYWxseSkgYWNjZXB0
Cj4gPiBzZXJpYWxpemVkIHN0YXRlIG1hdGNoaW5nIGFueSBvZiB2ZXJzaW9ucyAiQSIsICJCIiBv
ciAiQyIuCj4gPiAKPiA+IFRoYXQgaXMgc3VmZmljaWVudCBpZiBtaWdyYXRpb24gaXMgYmVpbmcg
dXNlZCBhcyBhIGhvc3QgdXBncmFkZQo+ID4gdG9vbCwgdG8gbW92ZSBmcm9tIE9TIHJlbGVhc2Ug
TiB0byBOICsgMS4KPiA+IAo+ID4gSXQgd291bGRuJ3QgY292ZXIgdGhlIGNhc2Ugd2hlcmUgeW91
IG5lZWQgdG8gc3VwcG9ydCBiYWNrd2FyZHMKPiA+IG1pZ3JhdGlvbiB0b28uIGVnIGlmIHlvdSBo
YXZlIGEgbWl4dHVyZSBvZiBob3N0cyB3aXRoIHJlbGVhc2UKPiA+IE4gYW5kIE4gKyAxIGFuZCB3
YW50IHRvIG1ha2Ugc3VyZSB0aGF0IFZNcyBjYW4gYWx3YXlzIG1vdmUKPiA+IGJldHdlZWVuIGFu
eSBob3N0LiAgVGhhdCB3b3VsZCByZXF1aXJlIHRoYXQgeW91IGNhbiBjcmVhdGUKPiA+IG1kZXZz
IHdpdGggdGhlIGxvd2VzdCBjb21tb24gZGVub21pbmF0b3IgdmVyc2lvbiwgbm90IHNvbGVseQo+
ID4gdGhlIG1vc3QgcmVjZW50Lgo+ID4gCj4gPiBJbiBRRU1VIHRoaXMgaXMgZG9uZSBieSBtZ210
IGFwcGxpY2F0aW9ucyBwaWNraW5nIGEgdmVyc2lvbmVkCj4gPiBtYWNoaW5lIHR5cGUgZm9yIFFF
TVUgdGhhdCBpcyBvbGRlciB0aGFuIG1vc3QgcmVjZW50Lgo+IAo+IEkgc3VwcG9zZSB3ZSdkIG5l
ZWQgdG8gZGV0ZXJtaW5lIGhvdyBpbXBvcnRhbnQgdGhhdCBpcywgdGhpcyBpcyBqdXN0IGEKPiBk
ZXZpY2UgYWZ0ZXIgYWxsLCB0aGVyZSBhcmUgYWx3YXlzIGZhbGxiYWNrIG1lY2hhbmlzbXMgdmlh
IGhvdHBsdWcuCj4gVGhlcmUgYXJlIGEgbG90IG9mIHBpZWNlcyB0aGF0IG5lZWQgdG8gbGluZSB1
cCBmb3IgYmFja3dhcmRzIG1pZ3JhdGlvbgo+IGluY2x1ZGluZyBzdXBwb3J0IGZvciBpdCBhdCB0
aGUgaW5kaXZpZHVhbCB2ZW5kb3IgZHJpdmVyLiAgTm90aGluZyB3ZQo+IGRlc2lnbiBpbnRvIHRo
ZSBBUEkgaXMgZ29pbmcgdG8gcmVxdWlyZSB2ZW5kb3IgZHJpdmVycyB0byBzdXBwb3J0Cj4gYmFj
a3dhcmRzIG1pZ3JhdGlvbiBhbmQgd2UgYWxyZWFkeSBoYXZlIHNvbWUgdmVuZG9ycyByZXF1aXJp
bmcgaG9zdCBhbmQKPiBndWVzdCBkcml2ZXIgYWxpZ25tZW50LiAgU3BlY2lmeWluZyBhIHZlcnNp
b24gd2l0aCBhIGNyZWF0ZSBzeW50YXggYXMKPiB5b3UndmUgcHJvdmlkZWQgaXMgcmVhc29uYWJs
ZSwgYnV0IHRoaXMgYWxzbyBiYWxsb29ucyBpbnRvIHdob2xlCj4gdGFuZ2VudGlhbCBpbnRlcmZh
Y2UgcHJvdmlkaW5nIGluZm9ybWF0aW9uIHJlZ2FyZGluZyB3aGF0IHZlcnNpb25zIGEKPiB2ZW5k
b3IgZHJpdmVyIGlzIGFibGUgdG8gY3JlYXRlLCBiZWNhdXNlIHByZXN1bWFibHkgbWFuYWdlbWVu
dCB0b29scwo+IHdvdWxkbid0IHByZWZlciBhIHRyeS1hbmQtc2VlIHR5cGUgaW50ZXJmYWNlLiAg
SSBiZWxpZXZlIGFuIGludGVudGlvbmFsCj4gYXNwZWN0IG9mIHRoZSBwcm9wb3NhbCBoZXJlIGlz
IHRoYXQgd2UgZG9uJ3QgbmVlZCB0byBwcm92aWRlIGEgbGlzdCBvZgo+IGNvbXBhdGlibGUgdmVy
c2lvbnMsIHRoYXQncyBoYW5kbGVkIGludGVybmFsbHkgdG8gdGhlIHZlbmRvciBkcml2ZXIuCgpX
b3JzZSBpcyB0aGF0IG11bHRpLXZlcnNpb25zIGJhY2t3YXJkcyBtaWdyYXRpb24gYWxzbyBiYWxs
b29ucyB0aGUKdGVzdGluZyBtYXRyaXggd2hpY2ggaXMgcGFydGljdWxhcmx5IHRpbWUgY29uc3Vt
aW5nLgoKVG8gYmUgY2xlYXIgSSdtIC9ub3QvIHNheWluZyB0aGF0IG11bHRpLXZlcnNpb25zIGJh
Y2t3YXJkcyBtaWdyYXRpb24KaXMgYSBtdXN0LWhhdmUuIEkganVzdCB3YW50IHRvIGJlIHN1cmUg
d2UgdW5kZXJzdGFuZCB0aGUgbGltaXRhdGlvbnMKb2Ygd2hhdCdzIHByb3Bvc2VkIGFuZCB0aGF0
IHdlJ3JlIGhhcHB5IHdpdGggdGhlbS4KCkNlcnRhaW5seSBmb3J3YXJkcyBtaWdyYXRpb24gaXMg
dGhlIHJlYWxseSBiaWcgd2luIGhlcmUuCgpCYWNrd2FyZHMgbWlncmF0aW9uIGlzIG1vcmUgb2Yg
YSBuaWNlLXRvLWhhdmUgYW5kIG9ubHkgd29ydGggZG9pbmcgaWYKd2UgZXhwZWN0IHBlb3BsZSBh
cmUgd2lsbGluZyB0byBhY3R1YWxseSBkbyBlbm91Z2ggdGVzdGluZyB0byBtYWtlCml0IHJlbGlh
YmxlLiBDbGFpbWluZyB0byBzdXBwb3J0IGJhY2t3YXJkcyBtaWdyYXRpb24gYW5kIHRoZW4KbmV2
ZXIgdGVzdGluZyBpdCB3b3JrcyBpcyBldmVuIHdvcnNlIHRoYW4gbm90IHN1cHBvcnRpbmcgaXQs
IGJlY2F1c2UKaXQgd2lsbCBiZSBhIHJhcmVseSBleGVyY2lzZWQgY29kZSBwYXRoIGNvbXBhcmF0
aXZlbHkgc3BlYWtpbmcsIHNvCmVhc3kgdG8gYml0LXJvdCBpZiBub3Qgd2VsbCB0ZXN0ZWQuCgpS
ZWdhcmRzLApEYW5pZWwKLS0gCnw6IGh0dHBzOi8vYmVycmFuZ2UuY29tICAgICAgLW8tICAgIGh0
dHBzOi8vd3d3LmZsaWNrci5jb20vcGhvdG9zL2RiZXJyYW5nZSA6fAp8OiBodHRwczovL2xpYnZp
cnQub3JnICAgICAgICAgLW8tICAgICAgICAgICAgaHR0cHM6Ly9mc3RvcDEzOC5iZXJyYW5nZS5j
b20gOnwKfDogaHR0cHM6Ly9lbnRhbmdsZS1waG90by5vcmcgICAgLW8tICAgIGh0dHBzOi8vd3d3
Lmluc3RhZ3JhbS5jb20vZGJlcnJhbmdlIDp8Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
