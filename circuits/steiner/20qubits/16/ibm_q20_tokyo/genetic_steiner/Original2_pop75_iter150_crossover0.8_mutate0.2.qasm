// Initial wiring: [5, 17, 1, 16, 11, 10, 15, 13, 18, 6, 8, 0, 7, 2, 14, 9, 19, 4, 12, 3]
// Resulting wiring: [5, 17, 1, 16, 11, 10, 15, 13, 18, 6, 8, 0, 7, 2, 14, 9, 19, 4, 12, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[2], q[1];
cx q[6], q[3];
cx q[7], q[6];
cx q[11], q[9];
cx q[12], q[7];
cx q[13], q[6];
cx q[13], q[7];
cx q[6], q[3];
cx q[15], q[13];
cx q[18], q[12];
cx q[12], q[7];
cx q[19], q[18];
cx q[11], q[17];
cx q[9], q[10];
cx q[2], q[3];
cx q[3], q[5];
cx q[3], q[4];
