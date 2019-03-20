// Initial wiring: [0 1 2 3 4 5 7 6 8]
// Resulting wiring: [0 1 2 3 4 5 7 6 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[0];
cx q[5], q[6];
cx q[4], q[3];
