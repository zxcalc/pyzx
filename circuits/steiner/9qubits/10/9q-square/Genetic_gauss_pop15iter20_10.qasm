// Initial wiring: [0 1 2 3 5 4 6 7 8]
// Resulting wiring: [5 1 2 8 6 3 0 7 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[6];
cx q[3], q[4];
cx q[5], q[6];
cx q[5], q[6];
cx q[5], q[6];
cx q[3], q[8];
cx q[3], q[8];
cx q[3], q[8];
cx q[5], q[0];
cx q[5], q[0];
cx q[0], q[1];
cx q[2], q[3];
cx q[3], q[4];
cx q[3], q[4];
cx q[3], q[4];
cx q[1], q[4];
cx q[5], q[4];
cx q[5], q[6];
cx q[7], q[4];
