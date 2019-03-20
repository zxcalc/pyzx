// Initial wiring: [2 4 1 3 7 6 5 0 8]
// Resulting wiring: [3 2 1 7 4 6 5 0 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[4];
cx q[3], q[4];
cx q[3], q[4];
cx q[3], q[4];
cx q[4], q[7];
cx q[4], q[7];
cx q[4], q[7];
cx q[8], q[3];
cx q[3], q[2];
cx q[3], q[2];
cx q[7], q[8];
cx q[5], q[0];
cx q[1], q[2];
cx q[7], q[6];
