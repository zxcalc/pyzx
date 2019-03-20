// Initial wiring: [0 2 7 3 1 4 6 5 8]
// Resulting wiring: [0 2 7 3 1 4 6 5 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[8], q[7];
cx q[7], q[6];
cx q[0], q[1];
cx q[2], q[3];
cx q[7], q[4];
