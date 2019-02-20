Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp4335342ywa;
        Wed, 20 Feb 2019 03:42:57 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZImlWpdZYSV8tKiHzf1xwSk6Z/RA8Lt3V5HlU7YmrL1dUrZNpTWAEh1iVpWSfZmG2115U0
X-Received: by 2002:a17:902:7e49:: with SMTP id a9mr14333056pln.303.1550662977139;
        Wed, 20 Feb 2019 03:42:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550662977; cv=none;
        d=google.com; s=arc-20160816;
        b=IfGbUG7wW8OxiDYoq3AV8UqFYYrhdgJVDIg3XZPtq6BQiHCF/bR4S42TcIyEQ+FuFy
         +iB/45Gur1QE1LIVmOg/ouz4+e9z630eH9Dx9BIoJ4rv943Vi3g26LkQ9a5qEGquohHP
         9NNHc29b+MpQGmir4nOS7SrMO16nfWsds+3i5xPuKblJRDOIKlH9JvVYWI/6q8w1u2tT
         11LwixTrjyrq54Xu8VNFlFnjiUfm97BxRC0yOwh5LhPQYqwVQXMoYxDoB9EzgQh00+6x
         MdO+szKe55VrJlIT2fj16mkuljetzwLfhM8JTWtca3mggNCcizDdSDaga9r/0KXV/O9E
         +YVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:organization:references:in-reply-to
         :message-id:subject:to:from:date:delivered-to;
        bh=JMOT+E/aBS3enZGakIxQ/1X/V2myLc7YfQO15ul8vBY=;
        b=Bj8P5vyd6rhIebO0R07Qv/fuMtB3YqlMn7fDRfaomX315i8yfc3Sy3MNx5qlIDPLnx
         s8DHe+qdgkLSC86OirxVINOeQMrn7WJ9f6MRuYD1/2tnh5BmlgyEhuU8NGCTV5VWKfoT
         f/lV8ecrVyzyWC7h/X4nNCa8JGX+Ca7BmNoKKFfhb+iCCdwk8d8UJrfmdE4GCnH3K4Le
         EiarGbiEBRMG3Tmk3PJXiiYi4t32wu3IVfal85eG+D+OhGot6sQc/LI/e1iLLMXYfaaX
         LhzneyhIcPrQnVQzUsT+J3skiijg467+1c6tuSv7AJKDyW72HxTkuP+NbI4jrRlCoMmj
         tBhw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id d37si19978880plb.140.2019.02.20.03.42.56
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Feb 2019 03:42:57 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB8D89220;
	Wed, 20 Feb 2019 11:42:56 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D28B689220
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 20 Feb 2019 11:42:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5285FC007323;
 Wed, 20 Feb 2019 11:42:52 +0000 (UTC)
Received: from gondolin (dhcp-192-187.str.redhat.com [10.33.192.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B77061D19;
 Wed, 20 Feb 2019 11:42:44 +0000 (UTC)
Date: Wed, 20 Feb 2019 12:42:42 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: "Gonglei (Arei)" <arei.gonglei@huawei.com>
Subject: Re: [PATCH 0/5] QEMU VFIO live migration
Message-ID: <20190220124242.5a1685c5.cohuck@redhat.com>
In-Reply-To: <33183CC9F5247A488A2544077AF19020DB25D30F@dggeml511-mbx.china.huawei.com>
References: <1550566254-3545-1-git-send-email-yan.y.zhao@intel.com>
 <20190219113212.GC2941@work-vm>
 <20190220052838.GC16456@joy-OptiPlex-7040>
 <20190220110142.GD2608@work-vm>
 <33183CC9F5247A488A2544077AF19020DB25D30F@dggeml511-mbx.china.huawei.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Wed, 20 Feb 2019 11:42:53 +0000 (UTC)
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
Cc: "cjia@nvidia.com" <cjia@nvidia.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "Zhengxiao.zx@alibaba-inc.com" <Zhengxiao.zx@alibaba-inc.com>,
 "shuangtai.tst@alibaba-inc.com" <shuangtai.tst@alibaba-inc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "eauger@redhat.com" <eauger@redhat.com>,
 "yi.l.liu@intel.com" <yi.l.liu@intel.com>,
 "eskultet@redhat.com" <eskultet@redhat.com>,
 "ziye.yang@intel.com" <ziye.yang@intel.com>,
 "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>,
 "zhi.a.wang@intel.com" <zhi.a.wang@intel.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>, Zhao Yan <yan.y.zhao@intel.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "changpeng.liu@intel.com" <changpeng.liu@intel.com>,
 "Ken.Xue@amd.com" <Ken.Xue@amd.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gV2VkLCAyMCBGZWIgMjAxOSAxMToyODo0NiArMDAwMAoiR29uZ2xlaSAoQXJlaSkiIDxhcmVp
LmdvbmdsZWlAaHVhd2VpLmNvbT4gd3JvdGU6Cgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0KPiA+IEZyb206IERyLiBEYXZpZCBBbGFuIEdpbGJlcnQgW21haWx0bzpkZ2lsYmVydEByZWRo
YXQuY29tXQo+ID4gU2VudDogV2VkbmVzZGF5LCBGZWJydWFyeSAyMCwgMjAxOSA3OjAyIFBNCj4g
PiBUbzogWmhhbyBZYW4gPHlhbi55LnpoYW9AaW50ZWwuY29tPgo+ID4gQ2M6IGNqaWFAbnZpZGlh
LmNvbTsga3ZtQHZnZXIua2VybmVsLm9yZzsgYWlrQG96bGFicy5ydTsKPiA+IFpoZW5neGlhby56
eEBhbGliYWJhLWluYy5jb207IHNodWFuZ3RhaS50c3RAYWxpYmFiYS1pbmMuY29tOwo+ID4gcWVt
dS1kZXZlbEBub25nbnUub3JnOyBrd2Fua2hlZGVAbnZpZGlhLmNvbTsgZWF1Z2VyQHJlZGhhdC5j
b207Cj4gPiB5aS5sLmxpdUBpbnRlbC5jb207IGVza3VsdGV0QHJlZGhhdC5jb207IHppeWUueWFu
Z0BpbnRlbC5jb207Cj4gPiBtbGV2aXRza0ByZWRoYXQuY29tOyBwYXNpY0BsaW51eC5pYm0uY29t
OyBHb25nbGVpIChBcmVpKQo+ID4gPGFyZWkuZ29uZ2xlaUBodWF3ZWkuY29tPjsgZmVsaXBlQG51
dGFuaXguY29tOyBLZW4uWHVlQGFtZC5jb207Cj4gPiBrZXZpbi50aWFuQGludGVsLmNvbTsgYWxl
eC53aWxsaWFtc29uQHJlZGhhdC5jb207Cj4gPiBpbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZzsgY2hhbmdwZW5nLmxpdUBpbnRlbC5jb207Cj4gPiBjb2h1Y2tAcmVkaGF0LmNvbTsg
emhpLmEud2FuZ0BpbnRlbC5jb207IGpvbmF0aGFuLmRhdmllc0BudXRhbml4LmNvbQo+ID4gU3Vi
amVjdDogUmU6IFtQQVRDSCAwLzVdIFFFTVUgVkZJTyBsaXZlIG1pZ3JhdGlvbgo+ID4gCj4gPiAq
IFpoYW8gWWFuICh5YW4ueS56aGFvQGludGVsLmNvbSkgd3JvdGU6ICAKPiA+ID4gT24gVHVlLCBG
ZWIgMTksIDIwMTkgYXQgMTE6MzI6MTNBTSArMDAwMCwgRHIuIERhdmlkIEFsYW4gR2lsYmVydCB3
cm90ZTogIAo+ID4gPiA+ICogWWFuIFpoYW8gKHlhbi55LnpoYW9AaW50ZWwuY29tKSB3cm90ZTog
IAo+ID4gPiA+ID4gVGhpcyBwYXRjaHNldCBlbmFibGVzIFZGSU8gZGV2aWNlcyB0byBoYXZlIGxp
dmUgbWlncmF0aW9uIGNhcGFiaWxpdHkuCj4gPiA+ID4gPiBDdXJyZW50bHkgaXQgZG9lcyBub3Qg
c3VwcG9ydCBwb3N0LWNvcHkgcGhhc2UuCj4gPiA+ID4gPgo+ID4gPiA+ID4gSXQgZm9sbG93cyBB
bGV4J3MgY29tbWVudHMgb24gbGFzdCB2ZXJzaW9uIG9mIFZGSU8gbGl2ZSBtaWdyYXRpb24gcGF0
Y2hlcywKPiA+ID4gPiA+IGluY2x1ZGluZyBkZXZpY2Ugc3RhdGVzLCBWRklPIGRldmljZSBzdGF0
ZSByZWdpb24gbGF5b3V0LCBkaXJ0eSBiaXRtYXAncwo+ID4gPiA+ID4gcXVlcnkuICAKCj4gPiA+
ID4gICBiKSBIb3cgZG8gd2UgZGV0ZWN0IGlmIHdlJ3JlIG1pZ3JhdGluZyBmcm9tL3RvIHRoZSB3
cm9uZyBkZXZpY2Ugb3IKPiA+ID4gPiB2ZXJzaW9uIG9mIGRldmljZT8gIE9yIHNheSB0byBhIGRl
dmljZSB3aXRoIG9sZGVyIGZpcm13YXJlIG9yIHBlcmhhcHMKPiA+ID4gPiBhIGRldmljZSB0aGF0
IGhhcyBsZXNzIGRldmljZSBtZW1vcnkgPyAgCj4gPiA+IEFjdHVhbGx5IGl0J3Mgc3RpbGwgYW4g
b3BlbiBmb3IgVkZJTyBtaWdyYXRpb24uIE5lZWQgdG8gdGhpbmsgYWJvdXQKPiA+ID4gd2hldGhl
ciBpdCdzIGJldHRlciB0byBjaGVjayB0aGF0IGluIGxpYnZpcnQgb3IgcWVtdSAobGlrZSBhIGRl
dmljZSBtYWdpYwo+ID4gPiBhbG9uZyB3aXRoIHZlcmlvbiA/KS4gIAo+IAo+IFdlIG11c3Qga2Vl
cCB0aGUgaGFyZHdhcmUgZ2VuZXJhdGlvbiBpcyB0aGUgc2FtZSB3aXRoIG9uZSBQT0Qgb2YgcHVi
bGljIGNsb3VkCj4gcHJvdmlkZXJzLiBCdXQgd2Ugc3RpbGwgdGhpbmsgYWJvdXQgdGhlIGxpdmUg
bWlncmF0aW9uIGJldHdlZW4gZnJvbSB0aGUgdGhlIGxvd2VyCj4gZ2VuZXJhdGlvbiBvZiBoYXJk
d2FyZSBtaWdyYXRlZCB0byB0aGUgaGlnaGVyIGdlbmVyYXRpb24uCgpBZ3JlZWQsIGxvd2VyLT5o
aWdoZXIgaXMgdGhlIG9uZSBkaXJlY3Rpb24gdGhhdCBtaWdodCBtYWtlIHNlbnNlIHRvCnN1cHBv
cnQuCgpCdXQgcmVnYXJkbGVzcyBvZiB0aGF0LCBJIHRoaW5rIHdlIG5lZWQgdG8gbWFrZSBzdXJl
IHRoYXQgaW5jb21wYXRpYmxlCmRldmljZXMvdmVyc2lvbnMgZmFpbCBkaXJlY3RseSBpbnN0ZWFk
IG9mIGZhaWxpbmcgaW4gYSBzdWJ0bGUsIGhhcmQgdG8KZGVidWcgd2F5LiBNaWdodCBiZSB1c2Vm
dWwgdG8gZG8gc29tZSBpbml0aWFsIHNhbml0eSBjaGVja3MgaW4gbGlidmlydAphcyB3ZWxsLgoK
SG93IGVhc3kgaXMgaXQgdG8gb2J0YWluIHRoYXQgaW5mb3JtYXRpb24gaW4gYSBmb3JtIHRoYXQg
Y2FuIGJlCmNvbnN1bWVkIGJ5IGhpZ2hlciBsYXllcnM/IENhbiB3ZSBmaW5kIG91dCB0aGUgZGV2
aWNlIHR5cGUgYXQgbGVhc3Q/CldoYXQgYWJvdXQgc29tZSBraW5kIG9mIHJldmlzaW9uPwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2
IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
