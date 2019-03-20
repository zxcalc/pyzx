// Initial wiring: [0 4 2 1 3 6 7 5 8]
// Resulting wiring: [0 3 1 2 7 6 4 5 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[5];
cx q[7], q[4];
cx q[3], q[4];
cx q[3], q[4];
cx q[3], q[4];
cx q[8], q[7];
cx q[0], q[1];
cx q[3], q[2];
cx q[1], q[2];
cx q[1], q[2];
cx q[1], q[2];
cx q[6], q[7];
cx q[4], q[7];
cx q[4], q[7];
cx q[4], q[7];
cx q[1], q[4];
cx q[1], q[2];
cx q[0], q[1];
cx q[4], q[5];
