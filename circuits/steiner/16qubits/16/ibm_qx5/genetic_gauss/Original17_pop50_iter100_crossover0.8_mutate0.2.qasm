// Initial wiring: [5, 0, 3, 15, 14, 6, 1, 4, 2, 9, 11, 10, 12, 7, 8, 13]
// Resulting wiring: [5, 0, 3, 15, 14, 6, 1, 4, 2, 9, 11, 10, 12, 7, 8, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[2];
cx q[10], q[8];
cx q[10], q[7];
cx q[10], q[6];
cx q[11], q[8];
cx q[6], q[0];
cx q[6], q[1];
cx q[14], q[0];
cx q[12], q[1];
cx q[12], q[3];
cx q[15], q[9];
cx q[6], q[9];
cx q[10], q[13];
cx q[5], q[8];
cx q[1], q[7];
