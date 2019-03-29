// Initial wiring: [7, 3, 14, 13, 17, 6, 10, 18, 4, 0, 1, 11, 19, 2, 9, 8, 16, 5, 15, 12]
// Resulting wiring: [7, 3, 14, 13, 17, 6, 10, 18, 4, 0, 1, 11, 19, 2, 9, 8, 16, 5, 15, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[4];
cx q[8], q[2];
cx q[10], q[8];
cx q[11], q[9];
cx q[15], q[14];
cx q[15], q[13];
cx q[18], q[17];
cx q[19], q[10];
cx q[10], q[8];
cx q[11], q[18];
cx q[11], q[12];
cx q[10], q[11];
cx q[11], q[18];
cx q[11], q[12];
cx q[6], q[12];
cx q[3], q[5];
cx q[2], q[7];
cx q[7], q[6];
cx q[0], q[9];
