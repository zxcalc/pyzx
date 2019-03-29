// Initial wiring: [7, 8, 5, 6, 10, 9, 3, 4, 15, 12, 14, 0, 2, 11, 1, 13]
// Resulting wiring: [7, 8, 5, 6, 10, 9, 3, 4, 15, 12, 14, 0, 2, 11, 1, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[6], q[5];
cx q[7], q[6];
cx q[6], q[1];
cx q[8], q[7];
cx q[7], q[0];
cx q[8], q[7];
cx q[10], q[5];
cx q[11], q[4];
cx q[14], q[13];
cx q[12], q[13];
cx q[9], q[10];
cx q[7], q[8];
cx q[6], q[7];
cx q[7], q[8];
cx q[7], q[6];
cx q[5], q[6];
cx q[6], q[7];
cx q[7], q[8];
